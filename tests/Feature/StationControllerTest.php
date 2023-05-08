<?php

namespace Tests\Feature;

use App\Models\Api\v1\Station;
use Illuminate\Http\Response;
use Tests\TestCase;

class StationControllerTest extends TestCase
{
    public function testGetAllStations() {
        $this->withoutMiddleware();
        $this->json('get', 'api/v1/stations')
            ->assertStatus(Response::HTTP_OK)
            ->assertJsonStructure([
                "data" => [
                    '*' => [
                        'id',
                        'name',
                        'latitude',
                        'longitude',
                        'company',
                        'address'
                    ]
                ]
            ]);
    }

    public function testViewASingleStation() {
        $station = Station::create(Station::factory()->make()->getAttributes());
        $this->withoutMiddleware();

        $this->json('get', 'api/v1/stations/' . $station->id)
            ->assertStatus(Response::HTTP_OK)
            ->assertJsonStructure([
                "data" => [
                    'id',
                    'name',
                    'latitude',
                    'longitude',
                    'company',
                    'address'
                ]
            ]);
    }

    public function testStoreANewStation() {
        $payload = Station::factory()->make();

        $this->withoutMiddleware();
        $this->json('post', 'api/v1/stations', $payload->getAttributes())
            ->assertStatus(Response::HTTP_CREATED)
            ->assertJsonStructure([
                'data' => [
                    'id',
                    'name',
                    'latitude',
                    'longitude',
                    'company',
                    'address'
                ]
            ]);
    }

    public function testUpdateANewStation() {
        $station = Station::create(Station::factory()->make()->getAttributes());
        $payload = Station::factory()->make();

        $this->withoutMiddleware();
        $this->json('put', 'api/v1/stations/' . $station->id, $payload->getAttributes())
            ->assertStatus(Response::HTTP_OK)
            ->assertJsonStructure([
                'data' => [
                    'id',
                    'name',
                    'latitude',
                    'longitude',
                    'company',
                    'address'
                ]
            ]);
    }


    public function testDeleteAStation() {
        $stationAttributes = Station::factory()->make()->getAttributes();
        $station = Station::create($stationAttributes);

        $this->withoutMiddleware();
        $this->json('delete', 'api/v1/stations/'.$station->id)
            ->assertStatus(Response::HTTP_NO_CONTENT)
            ->assertNoContent();
    }
}
