<?php

namespace App\Http\Resources\Order;

use Illuminate\Http\Resources\Json\JsonResource;

class OrderDetailsResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this['id'],
            'order_id' => $this['order_id'],
            'pizza_number' => $this['pizza_number'],
            'type' => $this['type'],
            'crust' => $this['crust'],
            'size' => $this['size'],
            'total_toppings' => $this['total_toppings'],
            'toppings' => ToppingResource::collection($this->topping)
        ];
    }
}