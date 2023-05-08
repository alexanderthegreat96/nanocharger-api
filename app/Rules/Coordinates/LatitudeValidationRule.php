<?php

namespace App\Rules\Coordinates;
use Illuminate\Contracts\Validation\ValidationRule;
use Closure;
use Illuminate\Translation\PotentiallyTranslatedString;

class LatitudeValidationRule implements ValidationRule
{
    /**
     * @var string
     */
    protected $alias = 'lat_validation';

    /**
     * @return string
     */
    public function __toString(): string
    {
        return $this->alias;
    }

    /**
     * Run the validation rule.
     *
     * @param Closure(string): PotentiallyTranslatedString $fail
     */

    public function validate(string $attribute, mixed $value, Closure $fail): void
    {
        if(!preg_match('/^[-]?(([0-8]?[0-9])\.(\d+))|(90(\.0+)?)$/', $value)){
            $fail('The longitude value is invalid. Example: 50.4511544541');
        }
    }
}
