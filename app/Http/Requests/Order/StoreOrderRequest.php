<?php

namespace App\Http\Requests\Order;

use App\Enums\RulesMessage;
use Illuminate\Foundation\Http\FormRequest;

class StoreOrderRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return [
            "order_items.*.required" => RulesMessage::order['required']['order_item'],
            "order_items.order_number.required" => RulesMessage::order['required']['order_number'],
            "order_items.*.order_pizzas.custom_toppings.required_if" => RulesMessage::order['required']['custom_toppings'],
        ];
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'order_items.*' => 'array|required',
            'order_items.order_number' => 'integer|required|unique:orders,order_number',
            'order_items.*.order_pizzas.custom_toppings' => 'required_if:order_items.*.pizza_type,custom',
        ];
    }
}