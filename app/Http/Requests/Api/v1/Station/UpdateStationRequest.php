<?php

namespace App\Http\Requests\Api\v1\Station;

use App\Rules\Coordinates\LatitudeValidationRule;
use App\Rules\Coordinates\LongitudeValidationRule;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Foundation\Http\FormRequest;

class UpdateStationRequest extends FormRequest
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
            'name' => ['max: 100'],
            'latitude' => ['max: 150' , new LatitudeValidationRule()],
            'longitude' => ['max: 150' , new LongitudeValidationRule()],
            'company_id' => ['int'],
            'address' => ['string','max: 200']
        ];
    }
}
