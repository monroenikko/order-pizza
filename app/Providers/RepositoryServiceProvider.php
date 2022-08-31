<?php

namespace App\Providers;

use App\Services\OrderService;
use App\Repositories\OrderRepository;
use Illuminate\Support\ServiceProvider;
use App\Interfaces\Services\OrderServiceInterface;
use App\Interfaces\Repositories\OrderRepositoryInterface;

class RepositoryServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        $this->app->bind(OrderServiceInterface::class, OrderService::class);
        $this->app->bind(OrderRepositoryInterface::class, OrderRepository::class);
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}