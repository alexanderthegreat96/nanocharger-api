<?php

use App\Helpers\Math;
use App\Models\Api\v1\Company;
use App\Models\Api\v1\Station;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Route;
use Location\Coordinate;
use Location\Distance\Vincenty;

function generateRandomPoint($centre, $radius) {
    $radius_earth = 3959; //miles

    //Pick random distance within $distance;
    $distance = lcg_value()*$radius;

    //Convert degrees to radians.
    $centre_rads = array_map( 'deg2rad', $centre );

    //First suppose our point is the north pole.
    //Find a random point $distance miles away
    $lat_rads = (pi()/2) -  $distance/$radius_earth;
    $lng_rads = lcg_value()*2*pi();


    //($lat_rads,$lng_rads) is a point on the circle which is
    //$distance miles from the north pole. Convert to Cartesian
    $x1 = cos( $lat_rads ) * sin( $lng_rads );
    $y1 = cos( $lat_rads ) * cos( $lng_rads );
    $z1 = sin( $lat_rads );


    //Rotate that sphere so that the north pole is now at $centre.

    //Rotate in x axis by $rot = (pi()/2) - $centre_rads[0];
    $rot = (pi()/2) - $centre_rads[0];
    $x2 = $x1;
    $y2 = $y1 * cos( $rot ) + $z1 * sin( $rot );
    $z2 = -$y1 * sin( $rot ) + $z1 * cos( $rot );

    //Rotate in z axis by $rot = $centre_rads[1]
    $rot = $centre_rads[1];
    $x3 = $x2 * cos( $rot ) + $y2 * sin( $rot );
    $y3 = -$x2 * sin( $rot ) + $y2 * cos( $rot );
    $z3 = $z2;


    //Finally convert this point to polar co-ords
    $lng_rads = atan2( $x3, $y3 );
    $lat_rads = asin( $z3 );

    return array_map( 'rad2deg', array( $lat_rads, $lng_rads ) );
}
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/test', function() {

////    $coordinates = [57.773869870978764, 16.600260527917154];
////
////    debugger_utility(generateRandomPoint($coordinates, 10));
//
//    $lat_from = 62.25265450472472;
//    $lang_from = 25.743974453369567;
//
////    $lat_to = 61.97164362640635;
////    $lang_to = 26.659094036075672;
//
//    $lat_to = 62.24568766277512;
//    $lang_to = 25.760366609064484;
//
//    $calculate = \App\Helpers\Math::calculateDistanceBetweenTwoPoints($lat_from,$lang_from,$lat_to,$lang_to,'km');
//
//    debugger_utility($calculate);
//
//    debugger_utility(\App\Helpers\Math::computeDistanceHaversine($lat_from,$lang_from,$lat_to,$lang_to,'km'),'Haversine');
//    debugger_utility(\App\Helpers\Math::computeDistanceVincenty($lat_from,$lang_from,$lat_to,$lang_to,'km'),'Vincenty');
//
//

    $lat= 62.25265450472472;
    $long= 25.743974453369567;
    $unit = 'km';
    $radius = 15;


//    $stations = Station::closestToThis($lat, $long, $unit, 800)
//        ->with('company')
//        ->take(100)
//        ->get()
//        ->map(function ($item) use ($unit) {
//            return [
//                'id' => $item->id,
//                'name' => $item->name,
//                'latitude' => $item->latitude,
//                'longitude' => $item->longitude,
//                'hash' => base64_encode($item->latitude .':'. $item->longitude),
//                'distance' => [
//                    'unit' => $unit,
//                    'value' => round($item->distance, 2)
//                ],
//                'company_id' => $item->company_id,
//                'address' => $item->address
//            ];
//        })->toArray();
//
//    debugger_utility(\App\Helpers\Remap::organize($stations),'Array Debugger');

//    $companies = Company::where('id',6)
//        ->with(['stations' => function($stations) use ($lat,$long,$unit,$radius) {
//            $stations->closestToThis($lat,$long,$unit,$radius);
//        }])
//        ->with(['grandChildren.stations' => function($stations) use ($lat,$long,$unit,$radius) {
//            $stations->closestToThis($lat,$long,$unit,$radius);
//        }])
//        ->get()
//        ->toArray();
//



        /**
         * ->with(['stations' => function($stations) use ($lat,$long,$unit,$radius) {
        $stations->closestToThis($lat,$long,$unit,$radius);
        }])->get()->toArray();
         */

//    $companies = $companies->mapWithKeys(function($item) use ($unit) {
//        return $item['stations'] = [];
//    });


    DB::enableQueryLog();

    #$companyIds = Company::where('id',1)->with('grand_children')->get()->toArray();
    $companyIds = Company::query()
        ->select('id')
        ->where('id',1)
        ->with(['grand_children' => function($query) {
            return $query->select('id', 'parent_company_id');
        }])
        ->get()
        ->toArray();


    $ids = \App\Helpers\Remap::pullAllIds($companyIds);

    $stations = Station::closestToThis($lat, $long, $unit, $radius)->whereIn('company_id', $ids);

    debugger_utility($stations->get()->toArray());


});
