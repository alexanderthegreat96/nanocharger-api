<?php

use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\v1\CompanyController;
use App\Http\Controllers\Api\v1\LocateByCompanyController;
use App\Http\Controllers\Api\v1\LocateController;
use App\Http\Controllers\Api\v1\StationController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::prefix('/v1')->middleware('auth:sanctum')->group(function() {

    /**
     * Crud and general access
     */

    Route::apiResource('/stations', StationController::class);
    Route::apiResource('/companies', CompanyController::class);

    /**
     * Locate stations based on said coordinates
     */

    /**
     * /api/locate/
     * /api/locate/grouped
     * /api/locate/raw/
     * /api/locate/raw/grouped
     * /api/locate/by
     */

    Route::prefix('/locate')->group(function() {

        Route::post('/', [LocateController::class,'locate']);
        Route::post('/grouped',[LocateController::class,'locateGrouped']);
        Route::post('/by', [LocateByCompanyController::class, 'locate']);
        Route::post('/by-raw', [LocateByCompanyController::class, 'locateRaw']);

        Route::prefix('/raw')->group(function() {
            Route::post('/', [LocateController::class,'locateRaw']);
            Route::post('/grouped', [LocateController::class,'locateGroupedRaw']);
        });


    });

});


/**
 * Login and register
 * to grab the token
 */


Route::prefix('auth')->group(function() {
    Route::get('/welcome', function() {
        return response()->json(['status' => true, 'message' => 'Hello and welcome!'])->setStatusCode(200);
    });

    /**
     * Token for testing
     * 1|nfGkYgmBGwvVmlcu2NM2teMjVtbJow6xwsY7ESI3
     */

    Route::post('/create', [AuthController::class, 'createUser']);
    Route::post('/login', [AuthController::class, 'loginUser']);

});
