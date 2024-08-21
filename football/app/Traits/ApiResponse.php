<?php

namespace App\Traits;

trait ApiResponse
{
    protected $response = [];
    protected $html     = [];
    protected $stick    = false;

    public function setModalResponse($content, $header = '', $confirm = false)
    {
        return $this->appendResponse([
            'html' => [
                'content' => $content,
                'header'  => $header,
                'confirm' => $confirm
            ]
        ]);
    }

    function setHtml($content)
    {
        return $this->appendResponse([
            'html' => [
                'content' => $content
            ]
        ]);
    }

    public function reload()
    {
        return $this->appendResponse([
            'reload' => true
        ]);
    }

    public function redirect($to)
    {
        $to = request()->has('redirect') ? urldecode(request()->get('redirect')) : $to;

        return $this->appendResponse([
            'redirectTo' => $to
        ]);
    }

    public function success($message)
    {
        return $this->appendResponse([
            'message' => $message,
            'success' => true
        ]);
    }

    public function submitForm()
    {
        return $this->appendResponse([
            'submit' => true,
        ]);
    }

    public function error($errors)
    {
        return $this->appendResponse([
            'errors' => (is_array($errors)) ? $errors : [$errors],
        ]);
    }

    public function popupUrl($url)
    {
        return $this->appendResponse([
            'click_url' => $url,
        ]);
    }

    public function response($data = []): \Illuminate\Http\JsonResponse
    {
        if (!empty($data)) {
            $this->response = array_merge($data, $this->response);
        }

        if (!empty($this->html)) {
            $this->response = array_merge(['htmls' => $this->html], $this->response);
            $this->html     = [];
        }

        if ($this->stick) {
            $this->stick    = false;
            $this->response = array_merge(['stick' => true], $this->response);
        }

        return response()->json($this->response);
    }

    public function callback($function)
    {
        return $this->appendResponse([
            'callback' => $function
        ]);
    }

    public function addHtml($target, $html)
    {
        $this->html[] = [$target => $html];

        return $this;
    }

    public function stick()
    {
        $this->stick = true;

        return $this;
    }

    public function __toString()
    {
        return json_encode($this->response);
    }

    public function routeLink($route, $param = [], $text)
    {
        return "<a href='" . route($route, $param) . "'>$text</a>";
    }

    private function appendResponse(array $data = [])
    {
        $this->response = array_merge($data, $this->response);

        return $this;
    }

    public function unauthorised()
    {
        /** @todo Need to translate */
        return $this->appendResponse([
            'errors'       => ['Unauthorised'],
            'unauthorised' => true
        ])->response();
    }
}
