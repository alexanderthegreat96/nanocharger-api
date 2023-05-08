<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Redis;

class Cache
{

    public static function cachedLocations(
        string $latitude = '',
        string $longitude = '',
        int    $radius = 0,
        string $unit = 'km',
        array  $response = [],
        string $endpoint = 'locate',
        int    $companyId = 0
    )
    {
        $appendCompany = $companyId ? '_[' . $companyId . ']' : '';

        $key = 'results_[' . $latitude . ']_[' . $longitude . ']_[' . $radius . ']_[' . $unit . ']_[' . $endpoint . ']' . $appendCompany;
        $cached = Redis::get($key);

        if ($cached) {
            return [
                'status' => true,
                'cached' => json_decode($cached, true)
            ];

        }

        if ($response) {
            Redis::set($key, json_encode($response), 'EX', 30);
        }

        return [
            'status' => false,
            'data' => $response
        ];
    }
}
