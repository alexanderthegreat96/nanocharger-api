<?php

namespace App\Models\Api\v1;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Stephenjude\DefaultModelSorting\Traits\DefaultOrderBy;


class Company extends Model
{
    use HasFactory, DefaultOrderBy;

    /**
     * @var string[]
     */
    protected $fillable = [
        'parent_company_id',
        'company_name'
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
     * @return HasMany
     */
    public function children()
    {
        return $this->hasMany(self::class, 'parent_company_id');
    }


    public function stations(): HasMany
    {
        return $this->hasMany(Station::class, 'company_id', 'id');
    }

    /**
     * @return HasMany
     */
    public function grand_children()
    {
        return $this->children()->with(['grand_children' => function ($query) {
            return $query->select('id', 'parent_company_id');
        }]);
    }


}
