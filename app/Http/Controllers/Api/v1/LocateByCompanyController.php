<?php

namespace App\Http\Controllers\Api\v1;

use App\Helpers\Cache;
use App\Helpers\Math;
use App\Helpers\Remap;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\v1\LocateByCompanyRequest;
use App\Models\Api\v1\Company;
use App\Models\Api\v1\Station;
use Illuminate\Http\JsonResponse;

class LocateByCompanyController extends Controller
{
    /**
     * @param LocateByCompanyRequest $request
     * @return JsonResponse
     * Fetch all given stations within a certain radius\
     * based on company id and it's children
     */
    public function locate(LocateByCompanyRequest $request)
    {

        $lat = $request->latitude;
        $long = $request->longitude;
        $unit = $request->distanceUnit;
        $companyId = $request->companyId;

        $radius = 50;

        if ($request->has('radius')) {
            $radius = $request->radius;
        }

        /**
         * recursively fetch all company ids
         */

        $companyIds = Company::query()
            ->select('id')
            ->where('id', $companyId)
            ->with(['grand_children' => function ($query) {
                return $query->select('id', 'parent_company_id');
            }])
            ->get();

        if ($companyIds->isNotEmpty()) {

            $ids = Remap::pullAllIds($companyIds->toArray());

            $stations = [];

            $cached = Cache::cachedLocations($lat, $long, $radius, $unit, $stations, 'locate', $companyId);

            if ($cached['status']) {
                $stations = $cached['cached'];
                return response()->json([
                    'status' => true,
                    'cachedResponse' => true,
                    'data' => $stations
                ]);
            } else {

                $stations = Station::closestToThis($lat, $long, $unit, $radius)
                    ->whereIn('company_id', $ids)
                    ->take(100)
                    ->get()
                    ->map(function ($item) use ($unit) {
                        return [
                            'id' => $item->id,
                            'name' => $item->name,
                            'company' => [
                                'id' => $item->company->id,
                                'name' => $item->company->company_name
                            ],
                            'latitude' => $item->latitude,
                            'longitude' => $item->longitude,
                            'hash' => base64_encode($item->latitude . ':' . $item->longitude),
                            'distance' => [
                                'unit' => $unit,
                                'value' => round($item->distance, 2)
                            ],
                            'address' => $item->address
                        ];
                    });

                if ($stations->isNotEmpty()) {
                    $remapped = Remap::organize($stations->toArray());

                    Cache::cachedLocations($lat, $long, $radius, $unit, $remapped, 'locate', $companyId);

                    return response()->json([
                        'status' => True,
                        'data' => $remapped
                    ]);
                }
            }


        }

        return response()->json([
            'status' => False,
            'error' => 'No stations found.'
        ]);

    }

    /**
     * @param LocateByCompanyRequest $request
     * @return JsonResponse
     */
    public function locateRaw(LocateByCompanyRequest $request)
    {

        $lat = $request->latitude;
        $long = $request->longitude;
        $unit = $request->distanceUnit;
        $companyId = $request->companyId;

        $radius = 50;

        if ($request->has('radius')) {
            $radius = $request->radius;
        }

        /**
         * recursively fetch all company ids
         */

        $companyIds = Company::query()
            ->select('id')
            ->where('id', $companyId)
            ->with(['grand_children' => function ($query) {
                return $query->select('id', 'parent_company_id');
            }])
            ->get();

        if ($companyIds->isNotEmpty()) {

            $ids = Remap::pullAllIds($companyIds->toArray());

            $stations = [];

            $cached = Cache::cachedLocations($lat, $long, $radius, $unit, $stations, 'locateRaw', $companyId);

            if ($cached['status']) {
                $stations = $cached['cached'];
                return response()->json([
                    'status' => true,
                    'cachedResponse' => true,
                    'data' => $stations
                ]);
            } else {
                $stations = Station::with('company')
                    ->take(100)
                    ->get()
                    ->map(function ($item) use ($lat, $long, $unit, $radius) {
                        $distance = Math::computeDistanceHaversine($lat, $long, $item->latitude, $item->longitude, $unit);
                        return [
                            'id' => $item->id,
                            'name' => $item->name,
                            'company' => [
                                'id' => $item->company->id,
                                'name' => $item->company->company_name
                            ],
                            'latitude' => $item->latitude,
                            'longitude' => $item->longitude,
                            'hash' => base64_encode($item->latitude . ':' . $item->longitude),
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
                    Cache::cachedLocations($lat, $long, $radius, $unit, $remapped, 'locateRaw', $companyId);

                    return response()->json([
                        'status' => True,
                        'data' => $remapped
                    ]);
                }
            }


        }

        return response()->json([
            'status' => False,
            'error' => 'No stations found.'
        ])->setStatusCode(404);

    }
}
