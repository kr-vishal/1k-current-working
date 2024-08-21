<?php

namespace App\Http\Controllers\Api;

use App\Support\InvalidResourceException;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Support\Collection;
use Illuminate\Validation\UnauthorizedException;
use Illuminate\Validation\ValidationException;
use TCG\Voyager\Facades\Voyager;
use TCG\Voyager\Http\Controllers\Controller as VoyagerController;

class Controller extends VoyagerController
{
    protected $methods = [
        'GET'    => 'browse_',
        'POST'   => 'add_',
        'DELETE' => 'delete_',
        'PUT'    => 'edit_'
    ];

    /**
     * Controller constructor.
     * @throws AuthenticationException
     */
    public function __construct()
    {
        if (request()->is("api/resources/*")) {
            auth('api')->authenticate();

            $this->isAllowed();
        }
    }

    /**
     * @return bool
     * @throws AuthenticationException
     */
    public function isAllowed()
    {
        if (request()->route() != null) {

            if (request()->route()->hasParameter('slug')) {
                $dataType = Voyager::model('DataType')
                                   ->where('slug', '=', request()->route()->parameter('slug'))
                                   ->first();

                if (is_null($dataType)) {
                    throw new InvalidResourceException('Invalid Resource');
                }
            }

            $ability = $this->getRequestAbility();

            if (auth('api')->check() && auth('api')->user()->can($ability)) {
                return true;
            } else {
                /** @todo Need to translate */
                throw new UnauthorizedException("Unauthorized");
            }
        } else {
            /** @todo Need to translate */
            throw new AuthenticationException("Unauthorized");
        }
    }

    public function getRequestAbility()
    {
        $ability  = $this->methods[ request()->method() ];
        $resource = request()->route()->parameter('slug', "");

        return $ability . $resource;
    }

    protected function getValidationRules(Collection $dataRows)
    {
        $validations = [];

        foreach ($dataRows as $row) {
            if (!empty($row->details->validation)) {
                $validations[ $row->field ] = $row->details->validation->rule;
            }
        }

        return $validations;
    }

    protected function validateRequest(Collection $dataRows)
    {
        $validations = $this->getValidationRules($dataRows);

        $validator = \Validator::make(request()->all(), $validations);

        if ($validator->fails()) {
            throw new ValidationException($validator);
        }
    }

    public function getFields( Collection $rows, $type = 'browse'){
        $rows = $rows->sortBy('order');

        $fields = [];

        foreach( $rows as $row ){
            if( isset($row->{$type}) && $row->{$type} ){
                $fields[] = $row->field;
            }
        }

        return $fields;
    }
}
