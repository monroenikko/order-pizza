<?php

namespace App\Enums;

class RulesMessage
{
    const order = [
        'success' => [
            "created" => "Order successfully created.",
            "updated" => "Order successfully updated.",
            "listed" => "List of Orders",
        ],
        'required' => [
            'order_item' => 'Order item is required.',
            'order_number' => 'Order number is required.',
            'custom_toppings' => 'Custom toppings is required.',
        ],
        'error' => [
            'base' => 'Error has been occured',
        ],
    ];
}