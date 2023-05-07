<?php

namespace App\Http\Requests\Api\v1;

use App\Rules\Coordinates\LatitudeValidationRule;
use App\Rules\Coordinates\LongitudeValidationRule;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;

class LocateByCompanyRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
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
            'latitude'=> ['required', new LatitudeValidationRule()],
            'longitude' => ['required' , new LongitudeValidationRule()],
            'distanceUnit' => ['required', 'in:km,mi'],
            'radius' => ['numeric'],
            'companyId' => ['required' , 'int']
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
