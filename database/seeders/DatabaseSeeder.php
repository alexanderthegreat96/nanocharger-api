<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\Api\v1\Company;
use App\Models\Api\v1\Station;
use Database\Factories\Api\v1\CompanyFactory;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        /**
         * Seed company data
         * for testing
         */

            Company::factory()
                ->count(30)
                ->create();

            Station::factory()
                ->count(30)
                ->create();
    }
}
