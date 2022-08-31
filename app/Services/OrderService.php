<?php

namespace App\Services;

use Exception;
use App\Enums\RulesMessage;
use App\Traits\ResponseApi;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\Order\OrderResource;
use App\Http\Resources\Order\OrderListResource;
use App\Interfaces\Services\OrderServiceInterface;
use App\Models\{OrderDetail, ToppingItem, Topping};
use App\Interfaces\Repositories\OrderRepositoryInterface;

class OrderService implements OrderServiceInterface
{
    use ResponseApi;

    protected $repository;

    public function __construct(OrderRepositoryInterface $repository)
    {
        $this->repository = $repository;
    }

    public function index($data)
    {
        try {
            $orders = $this->repository->index($data)
                ->orderBY('id', 'DESC')
                ->paginate((integer)$data['paginate']);

            return $this->success(
                    RulesMessage::order['success']['listed'],
                    Response::HTTP_OK,
                    new OrderListResource($orders)
            );

        } catch (Exception $e) {
            return $this->error($e->getMessage(), Response::HTTP_BAD_REQUEST);
        }
    }

    public function store($data)
    {
        DB::beginTransaction();
        try {

            $order = $this->repository->store($data);
            $order_items = $data['order_items']['order_pizzas'];

            if( count((array) $order_items) ){
                foreach($order_items as $item)
                {
                    $detail = new OrderDetail();
                    $detail->pizza_number = $item['pizza_number'];
                    $detail->size = $item['size'];
                    $detail->crust = $item['crust'];
                    $detail->type = $item['pizza_type'];
                    $detail->order_id = $order->id;
                    $detail->save();

                    $counter = 0;
                    if(count((array)$item['custom_toppings']))
                    {
                        foreach($item['custom_toppings'] as $key => $topping)
                        {
                            $top = new Topping();
                            $top->area = $topping['area'];
                            $top->topping_number = $key;
                            $top->order_detail_id = $detail->id;
                            $top->save();

                            if (count((array) $topping['custom_item']))
                            {
                                foreach ($topping['custom_item'] as $custom) {
                                    $custom_top = new ToppingItem();
                                    $custom_top->topping_id = $top->id;
                                    $custom_top->name = $custom['topping'];
                                    $custom_top->save();
                                    $counter++;
                                }
                            }
                        }
                    }

                    if($counter !== 0){
                        $detail = OrderDetail::find($detail->id);
                        $detail->total_toppings = $counter;
                        $detail->save();
                    }

                }
            }
            $res = $this->repository->show($order->id);
            DB::commit();
            return $this->success(
                RulesMessage::order['success']['created'],
                Response::HTTP_OK,
                new OrderResource($res)
            );
        } catch (Exception $e) {
            DB::rollBack();
            return $this->error($e->getMessage(), Response::HTTP_BAD_REQUEST);
        }
    }
}
