<?php

namespace App\Http\Resources\Order;

use Illuminate\Http\Resources\Json\JsonResource;

class ToppingResource extends JsonResource
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
            'order_detail_id' => $this['order_detail_id'],
            'topping_number' => $this['topping_number'],
            'area' => $this['area'],
            'topping_items' => ToppingItemResource::collection($this->toppingItems),
        ];
    }
}