<?php

namespace App\Rules\Coordinates;

use Closure;
use Illuminate\Contracts\Validation\ValidationRule;
use Illuminate\Translation\PotentiallyTranslatedString;

class LongitudeValidationRule implements ValidationRule
{
    /**
     * @var string
     */
    protected $alias = 'long_validation';

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
        if(!preg_match('/^[-]?((((1[0-7][0-9])|([0-9]?[0-9]))\.(\d+))|180(\.0+)?)$/', $value)){
            $fail('The longitude value is invalid. Example: 50.4511544541');
        }
    }
}
