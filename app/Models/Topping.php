<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Topping extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_detail_id',
        'pizza_number',
        'area',
    ];


    public function toppingItems()
    {
        return $this->hasMany(ToppingItem::class);
    }
}