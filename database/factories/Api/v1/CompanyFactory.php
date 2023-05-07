<?php

namespace Database\Factories\Api\v1;

use App\Models\Api\v1\Company;
use Illuminate\Database\Eloquent\Factories\Factory;


/**
 * @extends Factory<Company>
 */
class CompanyFactory extends Factory
{

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'parent_company_id' => rand(0,30),
            'company_name' => fake('Fi-fi')->company()
        ];
    }
}
