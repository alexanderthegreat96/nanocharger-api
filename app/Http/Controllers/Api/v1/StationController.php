<?php

namespace App\Http\Controllers\Api\v1;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\v1\Station\StoreStationRequest;
use App\Http\Requests\Api\v1\Station\UpdateStationRequest;
use App\Http\Resources\Api\v1\StationResource;
use App\Models\Api\v1\Station;

class StationController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return StationResource::collection(Station::all());
    }


    /**
     * Store a newly created resource in storage.
     */
    public function store(StoreStationRequest $request)
    {
        return StationResource::make(Station::create($request->all()));
    }

    /**
     * Display the specified resource.
     */
    public function show(Station $station)
    {
        return StationResource::make($station);
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(UpdateStationRequest $request, Station $station)
    {
        $station->update($request->all());
        return StationResource::make($station);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Station $station)
    {
        $station->delete();
        return response(null)->setStatusCode(204);
    }
}
