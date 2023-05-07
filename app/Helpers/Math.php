<?php

namespace App\Helpers;

use Location\Coordinate;
use Location\Distance\Vincenty;
use Location\Distance\Haversine;

class Math
{
    /**
     * @param $latFrom
     * @param $longFrom
     * @param $latTo
     * @param $langTo
     * @param string $unit
     * @param int $decimalPoints
     * @return float|int
     */
    public static function computeDistanceHaversine($latFrom,$longFrom,$latTo,$langTo, string $unit='km', int $decimalPoints=2) {

        $coordinate1 = new Coordinate($latFrom, $longFrom);
        $coordinate2 = new Coordinate($latTo, $langTo);

        $calc = new Haversine();

        $distanceInMeters = $calc->getDistance($coordinate1,$coordinate2);


        if($distanceInMeters) {

            $result = 0;

            if ($unit == 'km') {
                $result = $distanceInMeters / 1000;
            }

            if($unit == 'mi') {
                $result = $distanceInMeters / 1609.34;
            }

            if($unit == 'ft') {
                $result = $distanceInMeters * 3.281;
            }

            if($unit == 'm') {
                $result = $distanceInMeters;
            }

            return round($result,$decimalPoints);
        }

        return 0;
    }


    /**
     * faster than haversine
     * but takes longer to compute
     * @param $latFrom
     * @param $longFrom
     * @param $latTo
     * @param $langTo
     * @param string $unit
     * @param int $decimalPoints
     * @return float|int
     */
    public static function computeDistanceVincenty($latFrom,$longFrom,$latTo,$langTo, string $unit='km', int $decimalPoints=2) {

        $coordinate1 = new Coordinate($latFrom, $longFrom);
        $coordinate2 = new Coordinate($latTo, $langTo);

        $calc = new Vincenty();

        $distanceInMeters = $calc->getDistance($coordinate1,$coordinate2);

        if($distanceInMeters) {

            $result = 0;

            if ($unit == 'km') {
                $result = $distanceInMeters / 1000;
            }

            if($unit == 'mi') {
                $result = $distanceInMeters / 1609.34;
            }

            if($unit == 'ft') {
                $result = $distanceInMeters * 3.281;
            }

            if($unit == 'm') {
                $result = $distanceInMeters;
            }

            return round($result,$decimalPoints);
        }

        return 0;
    }


}
