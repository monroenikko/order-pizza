<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ToppingItem extends Model
{
    use HasFactory;

    protected $fillable = [
        'topping_id',
        'name',
    ];

    public function topping()
    {
        return $this->belongsTo(Topping::class);
    }
}