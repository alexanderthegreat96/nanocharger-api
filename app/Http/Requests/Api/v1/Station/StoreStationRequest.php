<?php

namespace App\Http\Requests\Api\v1\Station;

use App\Rules\Coordinates\LatitudeValidationRule;
use App\Rules\Coordinates\LongitudeValidationRule;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class StoreStationRequest extends FormRequest
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
     * @return array<string, ValidationRule|array|string>
     */
    public function rules(): array
    {
        return [
            'name' => ['required', 'max: 100', 'unique:stations'],
            'latitude' => ['required', 'max: 150' , new LatitudeValidationRule()],
            'longitude' => ['required', 'max: 150' , new LongitudeValidationRule()],
            'company_id' => ['required', 'int'],
            'address' => ['required', 'string', 'max: 250']
        ];
    }
}
