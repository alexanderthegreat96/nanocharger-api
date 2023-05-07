<?php

namespace App\Providers;

use App\Rules\Coordinates\LatitudeValidationRule;
use App\Rules\Coordinates\LongitudeValidationRule;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\ServiceProvider;
use function Psy\debug;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
