<?php

namespace App\Http\Controllers\Api\v1;

use App\Helpers\Cache;
use App\Helpers\Remap;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\v1\LocateRequest;
use App\Models\Api\v1\Station;
use App\Helpers\Math;
use Illuminate\Http\JsonResponse;

class LocateController extends Controller
{
    /**
     * @param LocateRequest $request
     * @return JsonResponse
     * Find nearest charging stations
     * based on the current coordinates
     */

    public function locate(LocateRequest $request)
    {

        $lat = $request->latitude;
        $long = $request->longitude;
        $unit = $request->distanceUnit;

        $radius = 50;

        if ($request->has('radius')) {
            $radius = $request->radius;
        }

        $stations = [];

        $cached = Cache::cachedLocations($lat, $long,$radius,$unit,$stations);

        if($cached['status']) {
            $stations = $cached['cached'];
            return response()->json([
                'status' => true,
                'cachedResponse' => true,
                'data' => $stations
            ]);
        }
        else {
            $stations = Station::closestToThis($lat, $long, $unit, $radius)
                ->with('company')
                ->take(100)
                ->get()
                ->map(function ($item) use ($unit) {
                    return [
                        'id' => $item->id,
                        'name' => $item->name,
                        'company' => $item->company,
                        'latitude' => $item->latitude,
                        'longitude' => $item->longitude,
                        'distance' => [
                            'unit' => $unit,
                            'value' => round($item->distance, 2)
                        ],
                        'company_id' => $item->company_id,
                        'address' => $item->address
                    ];
                });

            if ($stations->isNotEmpty()) {

                Cache::cachedLocations($lat, $long,$radius,$unit,$stations->toArray());

                return response()->json([
                    'status' => true,
                    'data' => $stations
                ]);
            }
        }


        return response()->json([
            'status' => False,
            'error' => 'No stations found.'
        ]);

    }

    /**
     * @param LocateRequest $request
     * @return JsonResponse
     * Use Raw PHP
     * to Sort Results
     */

    public function locateRaw(LocateRequest $request)
    {
        $lat = $request->latitude;
        $long = $request->longitude;
        $unit = $request->distanceUnit;

        $radius = 50;

        if ($request->has('radius')) {
            $radius = $request->radius;
        }

        $stations = [];

        $cached = Cache::cachedLocations($lat, $long,$radius,$unit,$stations,'locateRaw');

        if($cached['status']) {
            $stations = $cached['cached'];
            return response()->json([
                'status' => true,
                'cachedResponse' => true,
                'data' => $stations
            ]);
        }
        else
        {
            $stations = Station::with('company')
                ->take(100)
                ->get()
                ->map(function ($item) use ($lat, $long, $unit, $radius) {
                    $distance = Math::computeDistanceHaversine($lat, $long, $item->latitude, $item->longitude, $unit);
                    return [
                        'id' => $item->id,
                        'name' => $item->name,
                        'company' => $item->company,
                        'latitude' => $item->latitude,
                        'longitude' => $item->longitude,
                        'distance' => [
                            'unit' => $unit,
                            'value' => $distance
                        ],
                        'company_id' => $item->company_id,
                        'address' => $item->address
                    ];
                })->where(function ($item) use ($radius) {
                    return $item['distance']['value'] <= $radius;
                })->sortBy(function ($item) {
                    return $item['distance']['value'];
                });

            if ($stations->isNotEmpty()) {

                Cache::cachedLocations($lat, $long,$radius,$unit,$stations->toArray(),'locateRaw');

                return response()->json([
                    'status' => true,
                    'data' => $stations
                ]);
            }
        }



        return response()->json([
            'status' => False,
            'error' => 'No stations found.'
        ]);

    }

    /**
     * @param LocateRequest $request
     * @return JsonResponse
     */
    public function locateGrouped(LocateRequest $request) {

        $lat = $request->latitude;
        $long = $request->longitude;
        $unit = $request->distanceUnit;

        $radius = 50;

        if ($request->has('radius')) {
            $radius = $request->radius;
        }

        $stations = [];

        $cached = Cache::cachedLocations($lat, $long,$radius,$unit,$stations,'locateGrouped');

        if($cached['status']) {
            $stations = $cached['cached'];
            return response()->json([
                'status' => true,
                'cachedResponse' => true,
                'data' => $stations
            ]);
        }
        else{
            $stations = Station::closestToThis($lat, $long, $unit, $radius)
                ->with('company')
                ->take(100)
                ->get()
                ->map(function ($item) use ($unit) {
                    return [
                        'id' => $item->id,
                        'name' => $item->name,
                        'company' => $item->company,
                        'latitude' => $item->latitude,
                        'longitude' => $item->longitude,
                        'hash' => base64_encode($item->latitude .':'. $item->longitude),
                        'distance' => [
                            'unit' => $unit,
                            'value' => round($item->distance, 2)
                        ],
                        'company_id' => $item->company_id,
                        'address' => $item->address
                    ];
                });

            if ($stations->isNotEmpty()) {
                $remapped =  Remap::organize($stations->toArray());

                Cache::cachedLocations($lat, $long,$radius,$unit,$remapped,'locateGrouped');

                return response()->json([
                    'status' => true,
                    'data' => $remapped
                ]);
            }
        }

        return response()->json([
            'status' => False,
            'error' => 'No stations found.'
        ]);

    }

    /**
     * @param LocateRequest $request
     * @return JsonResponse
     */

    public function locateGroupedRaw(LocateRequest $request)
    {
        $lat = $request->latitude;
        $long = $request->longitude;
        $unit = $request->distanceUnit;

        $radius = 50;

        if ($request->has('radius')) {
            $radius = $request->radius;
        }

        $stations = [];

        $cached = Cache::cachedLocations($lat, $long,$radius,$unit,$stations,'locateGroupedRaw');

        if($cached['status']) {
            $stations = $cached['cached'];
            return response()->json([
                'status' => true,
                'cachedResponse' => true,
                'data' => $stations
            ]);
        }
        else {
            $stations = Station::with('company')
                ->take(100)
                ->get()
                ->map(function ($item) use ($lat, $long, $unit, $radius) {
                    $distance = Math::computeDistanceHaversine($lat, $long, $item->latitude, $item->longitude, $unit);
                    return [
                        'id' => $item->id,
                        'name' => $item->name,
                        'company' => $item->company,
                        'latitude' => $item->latitude,
                        'longitude' => $item->longitude,
                        'hash' => base64_encode($item->latitude .':'. $item->longitude),
                        'distance' => [
                            'unit' => $unit,
                            'value' => $distance
                        ],
                        'company_id' => $item->company_id,
                        'address' => $item->address
                    ];
                })->where(function ($item) use ($radius) {
                    return $item['distance']['value'] <= $radius;
                })->sortBy(function ($item) {
                    return $item['distance']['value'];
                });

            if ($stations->isNotEmpty()) {

                $remapped = Remap::organize($stations->toArray());
                Cache::cachedLocations($lat, $long,$radius,$unit,$remapped,'locateGroupedRaw');

                return response()->json([
                    'status' => true,
                    'data' => $remapped
                ]);
            }
        }


        return response()->json([
            'status' => False,
            'error' => 'No stations found.'
        ]);

    }
}
