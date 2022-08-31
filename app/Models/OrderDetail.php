<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_id',
        'pizza_number',
        'type',
        'crust',
        'size'
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }

    public function topping()
    {
        return $this->hasMany(Topping::class);
    }
}