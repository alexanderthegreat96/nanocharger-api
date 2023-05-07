<?php
namespace App\Helpers;


use Illuminate\Database\Eloquent\Builder;

class Remap
{
    /**
     * @param array $array
     * @return array
     * Using a bas64 hash
     * group stations together
     * for better readability
     */
    public static function organize(array $array = []) {
        if ( $array ) {

            $hashes = [];
            $results = [];


            /**
             * Iterate through data and grab hashes
             * append hashes to a second array
             * to organize everything
             */

            foreach($array as $item) {

                if(isset($item['hash']) &&
                    isset($item['latitude']) &&
                    isset($item['longitude']) &&
                    isset($item['distance'])) {

                    $hashes[] = $item['hash'];
                    $results[$item['hash']] = [
                        'hash' => $item['hash'],
                        'latitude' => $item['latitude'],
                        'longitude' => $item['longitude'],
                        'distance' => $item['distance'],
                        'stations' => []
                    ];
                }
            }

            /**
             * Find all elements whose hash
             * are identical to our hashes
             */

            if($hashes) {
                foreach(array_unique($hashes) as $hash) {
                    $items = [];
                    foreach($array as $item){
                        if(isset($item['hash']) && isset($item['name']) && isset($item['address']) && isset($item['company'])) {
                            if($item['hash'] == $hash) {
                                $items[$hash][] = [
                                    'name' => $item['name'],
                                    'address' => $item['address'],
                                    'company' => $item['company']
                                ];
                            }
                        }
                    }

                    /**
                     * Append the elements to the stations key
                     */
                    $results[$hash]['stations'] = $items[$hash];
                }
            }

           $output = [];

            /**
             * Get rid of the ugly hashes
             */

           if($results) {
               foreach($results as $result) {
                   unset($result['hash']);
                   $output[] = $result;
               }
           }

           return $output;
        }

        return [];
    }

    /**
     * @param array $companies
     * @param array $ids
     * @return array
     */
    public static function pullAllIds(array $companies = [], array &$ids=[]) {
        if($companies) {
            foreach ($companies as $company) {
                array_push($ids,$company['id']);
                if($company['grand_children']) {
                    self::pullAllIds($company['grand_children'] ,$ids);
                }
            }
        }
        return $ids;
    }

}

