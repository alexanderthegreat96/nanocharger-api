<?php

namespace App\Models\Api\v1;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Support\Facades\DB;
use Stephenjude\DefaultModelSorting\Traits\DefaultOrderBy;

class Station extends Model
{
    use HasFactory, DefaultOrderBy;

    /**
     * @var string[]
     */
    protected $fillable = [
        'name',
        'latitude',
        'longitude',
        'company_id',
        'address'
    ];

    /**
     * @var string
     */
    protected static $orderByColumn = 'created_at';

    /**
     * @var string
     */
    protected static $orderByColumnDirection = 'desc';

    /**
     * @return BelongsTo
     */
    public function company(): BelongsTo
    {
        return $this->belongsTo(Company::class, 'company_id', 'id');
    }

    /**
     * Returns all the stations
     * whitin a certain radius
     * based on input coordinates
     * uses Haversine
     * @param Builder $query
     * @param string $latitude
     * @param string $longitude
     * @param string $unit
     * @param int $radius
     * @return Builder|null
     */
    public function scopeClosestToThis(Builder $query, string $latitude = '', string $longitude = '', string $unit = 'km', float $radius = 1000)
    {
        if (is_null($query->getQuery()->columns)) {
            $query->select($this->qualifyColumn('*'));
        }

        if ($latitude && $longitude) {

            $value = 6371;
            if ($unit == 'mi') {
                $value = 3959;
            }

            $query->addSelect(
                DB::raw("
                (
                ".$value." * acos(
                        cos( radians( " . DB::getPdo()->quote($latitude) . " ) ) * cos( radians( latitude ) ) * cos( radians( longitude ) -
                        radians( " . DB::getPdo()->quote($longitude) . " ) ) + sin( radians( " . DB::getPdo()->quote($latitude) . " ) ) * sin(
                        radians( latitude ))
		        )
	           ) AS distance
                "))
                ->having('distance', '<=', $radius)
                ->orderBy('distance');
            return $query;
        }
        return null;
    }
}
