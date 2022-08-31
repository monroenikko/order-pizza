<?php

namespace App\Http\Resources\Order;

use Carbon\Carbon;
use Illuminate\Http\Resources\Json\JsonResource;
use App\Http\Resources\Order\OrderDetailsResource;

class OrderListResource extends JsonResource
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
            'data' => $this->map(function ($item) {
                return [
                    'id' => $item['id'],
                    'order_number' => $item['order_number'],
                    'order_details' => OrderDetailsResource::collection($item->orderDetails),
                    'created_at' => $item['created_at']
                ];
            }),
            'pagination' => [
                'total' => $this->total(),
                'count' => is_null($this->lastItem()) ? 0 : $this->lastItem(),
                'per_page' => (int)$this->perPage(),
                'current_page' => $this->currentPage(),
                'total_pages' => $this->lastPage(),
                'previous_page_url' => $this->previousPageUrl(),
                'next_page_url' => $this->nextPageUrl()
            ]
        ];

   }
}