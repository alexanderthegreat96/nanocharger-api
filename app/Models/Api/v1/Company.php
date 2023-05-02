<?php

namespace App\Models\Api\v1;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Company extends Model
{
    use HasFactory;

    /**
     * @var string[]
     */
    protected $fillable = [
        'parent_company_id',
        'company_name'
    ];

    /**
     * @return HasMany
     */
    public function stations() : HasMany {
        return $this->hasMany(Station::class,'company_id','id');
    }
}
