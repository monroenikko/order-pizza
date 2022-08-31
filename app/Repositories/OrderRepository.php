<?php

namespace App\Repositories;

use App\Models\{Order};
use App\Interfaces\Repositories\OrderRepositoryInterface;

class OrderRepository implements OrderRepositoryInterface
{
    private $model, $orderDetail;

    public function __construct(Order $model)
    {
        $this->model = $model;
    }

    public function index($data)
    {
        $searchKeyword = $data['search'];

        return $this->model->with([
                    'orderDetails',
                    'orderDetails.topping',
                    'orderDetails.topping.toppingItems'
                ])
                ->when(isset($searchKeyword), function($query) use ($searchKeyword)
                {
                    $query->where('order_number', 'LIKE', '%' . $searchKeyword . '%');

                    $query->orWhereHas('orderDetails', function($order) use ($searchKeyword) {
                        $order->where('size', 'LIKE', '%' . $searchKeyword . '%');
                        $order->orWhere('crust', 'LIKE', '%' . $searchKeyword . '%');
                        $order->orWhere('type', 'LIKE', '%' . $searchKeyword . '%');
                    });

                    $query->orWhereHas('orderDetails.topping', function($topping) use ($searchKeyword) {
                        $topping->where('topping_number', 'LIKE', '%' . $searchKeyword . '%');
                    });
                });
    }

    public function store($data)
    {
        return $this->model->create([
            'order_number' => $data['order_items']['order_number']
        ]);
    }

    public function show($id)
    {
        return $this->model->find($id);
    }
}