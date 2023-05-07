<?php

namespace App\Http\Requests\Api;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Support\Facades\Auth;

class CreateUserRequest extends FormRequest
{

    /**
     * Determine if the user is authorized to make this request.
     */

    public function authorize(): bool
    {
        if (Auth::user()) {
            return false;
        }

        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array|string>
     */

    public function rules(): array
    {
        return [
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required'
        ];
    }


    /**
     * @param Validator $validator
     * @return void
     */
    public function failedValidation(Validator $validator)
    {
        $response = response()
            ->json([
                'status' => false,
                'errors' => $validator->errors()
            ])
            ->setStatusCode(422);

        throw new HttpResponseException($response);
    }
}
