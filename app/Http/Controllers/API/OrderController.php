<?php

namespace App\Http\Controllers\API;

use App\Traits\ResponseApi;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Requests\Order\StoreOrderRequest;
use App\Interfaces\Services\OrderServiceInterface;

class OrderController extends Controller
{
    public function __construct(OrderServiceInterface $service)
    {
        $this->service = $service;
    }

    public function index(Request $request)
    {
        return $this->service->index($request);
    }

    public function store(StoreOrderRequest $request)
    {
        return $this->service->store($request->validated());
    }
}