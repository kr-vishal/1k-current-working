<?php

namespace App\Http\Requests;

use App\Traits\ApiResponse;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;

class RegisterRequest extends FormRequest
{
    use ApiResponse;
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return request()->has('social_login') ? [
            'name'     => 'required|max:100',
            'email'    => 'email|required'
        ] : [
            'name'     => 'required|max:100',
            'email'    => 'email|required|unique:users',
            'password' => 'required|confirmed',
        ];
    }

    public function messages(): array
    {
        return [
          'email.unique' => "Email ID is already registered"
        ];
    }

    protected function failedValidation( Validator $validator )
    {
        return $this->error($validator->errors())->response();
    }
}
