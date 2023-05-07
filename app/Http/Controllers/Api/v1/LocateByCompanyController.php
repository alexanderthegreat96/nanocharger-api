<?php

namespace App\Http\Controllers\Api\v1;

use App\Helpers\Math;
use App\Helpers\Remap;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\v1\LocateByCompanyRequest;
use App\Models\Api\v1\Company;
use App\Models\Api\v1\Station;

class LocateByCompanyController extends Controller
{
    /**
     * @param LocateByCompanyRequest $request
     * @return \Illuminate\Http\JsonResponse
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
            ->where('id',$companyId)
            ->with(['grand_children' => function($query) {
                return $query->select('id', 'parent_company_id');
            }])
            ->get();

        if($companyIds->isNotEmpty()) {

            $ids = Remap::pullAllIds($companyIds->toArray());
            $stations = Station::closestToThis($lat, $long, $unit, $radius)
                ->whereIn('company_id', $ids)
                ->take(100)
                ->get()
                ->map(function($item) use ($unit) {
                    return [
                        'id' => $item->id,
                        'name' => $item->name,
                        'company' => [
                            'id' => $item->company->id,
                            'name' => $item->company->company_name
                        ],
                        'latitude' => $item->latitude,
                        'longitude' => $item->longitude,
                        'hash' => base64_encode($item->latitude .':'. $item->longitude),
                        'distance' => [
                            'unit' => $unit,
                            'value' => round($item->distance, 2)
                        ],
                        'address' => $item->address
                    ];
                });

            if ($stations->isNotEmpty()) {
                return response()->json([
                    'status' => True,
                    'data' => Remap::organize($stations->toArray())
                ]);
            }
        }

        return response()->json([
            'status' => False,
            'error' => 'No stations found.'
        ])->setStatusCode(404);

    }

    /**
     * @param LocateByCompanyRequest $request
     * @return \Illuminate\Http\JsonResponse
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
            ->where('id',$companyId)
            ->with(['grand_children' => function($query) {
                return $query->select('id', 'parent_company_id');
            }])
            ->get();

        if($companyIds->isNotEmpty()) {

            $ids = Remap::pullAllIds($companyIds->toArray());
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
                return response()->json([
                    'status' => True,
                    'data' => Remap::organize($stations->toArray())
                ]);
            }
        }

        return response()->json([
            'status' => False,
            'error' => 'No stations found.'
        ])->setStatusCode(404);

    }
}
