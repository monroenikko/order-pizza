import axios from "axios";

const saveOrderItem = async(orderNumber, orderPizzas) => await axios.post(`/api/orders`, {
    order_items: {
        order_number: orderNumber,
        order_pizzas: orderPizzas
    }
});

const getOrderItemsAsync = async(search, page, paginate) => await axios.get(`/api/orders?search=${search}&page=${page}&paginate=${paginate}`);

export {
    saveOrderItem,
    getOrderItemsAsync
}