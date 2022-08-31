<?php

namespace App\Interfaces\Services;

interface OrderServiceInterface
{
    public function index($request);

    public function store($request);
}