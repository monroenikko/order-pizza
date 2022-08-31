<?php

namespace App\Interfaces\Repositories;

interface OrderRepositoryInterface
{
    public function index($request);

    public function show($id);

    public function store($request);
}