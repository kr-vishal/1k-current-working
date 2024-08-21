<?php

namespace App\Http\Controllers\Api;

use App\Traits\Voyager\IndexAction;
use Illuminate\Database\Eloquent\SoftDeletes;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Symfony\Component\Translation\Exception\NotFoundResourceException;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\Traits\BreadRelationshipParser;

class DataController extends Controller
{
    use BreadRelationshipParser, IndexAction;

    public function fetch()
    {
        dd("Yes");
    }

    public function list(Request $request, $slug)
    {
        return $this->getIndex($request, $slug);
    }

    public function browse(Request $request, $slug, $id)
    {
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        if (strlen($dataType->model_name) != 0) {
            $model = app($dataType->model_name);

            // Use withTrashed() if model uses SoftDeletes and if toggle is selected
            if ($model && in_array(SoftDeletes::class, class_uses_recursive($model))) {
                $model = $model->withTrashed();
            }
            if ($dataType->scope && $dataType->scope != '' && method_exists($model, 'scope' . ucfirst($dataType->scope))) {
                $model = $model->{$dataType->scope}();
            }
            $dataTypeContent = call_user_func([$model, 'find'], $id);

            if (is_null($dataTypeContent)) {
                throw new NotFoundResourceException($dataType->display_name_singular . ' not found !');
            }

            if ($dataTypeContent->deleted_at) {
                $isSoftDeleted = true;
            }
        } else {
            // If Model doest exist, get data from table name
            $dataTypeContent = DB::table($dataType->name)->where('id', $id)->first();
        }

        // Replace relationships' keys for labels and create READ links if a slug is provided.
        $dataTypeContent = $this->resolveRelations($dataTypeContent, $dataType, true);

        // If a column has a relationship associated with it, we do not want to show that field
        $this->removeRelationshipField($dataType, 'read');

        // Check if BREAD is Translatable
        $isModelTranslatable = is_bread_translatable($dataTypeContent);

        // Eagerload Relations
        $this->eagerLoadRelations($dataTypeContent, $dataType, 'read', $isModelTranslatable);

        return $dataTypeContent;
    }

    public function add(Request $request, $slug)
    {
        $dataType = Voyager::model('DataType')->where('slug', '=', $slug)->first();

        $this->validateRequest($dataType->addRows);

        $data = $this->insertUpdateData(request(), $slug, $dataType->addRows, new $dataType->model_name());
        dd("listing");
    }

    public function delete()
    {

    }
}
