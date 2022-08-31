
<template>
   <div class="card">
        <header class="card-header">
            <p class="card-header-title">
                {{ this.$route.name }}
            </p>
            <div class="buttons p-3">
                <b-button type="is-success" @click="formSubmit()">Order</b-button>
            </div>
        </header>
        <div class="card-content">
            <p><b>Pizza Types:</b> <span v-for="(data, i) in pizzaDetails.types" :key="i">{{ data }} {{ pizzaDetails.types.length === (i+1) ? '' : ' | ' }} </span></p>
            <p><b>Pizza Sizes:</b> <span v-for="(data, i) in pizzaDetails.sizes" :key="i">{{ data }} {{ pizzaDetails.sizes.length === (i+1) ? '' : ' | ' }} </span></p>
            <p class="mb-5"><b>Pizza Crusts:</b> <span v-for="(data, i) in pizzaDetails.crusts" :key="i">{{ data }} {{ pizzaDetails.crusts.length === (i+1) ? '' : ' | ' }} </span></p>

            <div class="columns">
                <div class="column">
                    <form @submit.prevent="formSubmit">
                        <div class="content">
                            <b-field label="PML"
                                :type="{ 'is-danger': hasError }"
                                :message="messageError"
                            >
                                <b-input rows="20" v-model="pizza_order" maxlength="3000" type="textarea" :expanded="true"></b-input>
                            </b-field>
                        </div>
                    </form>
                </div>
                <div class="column">
                    <b-field label="ORDER RESULT: ">
                        <div class="content" v-if="hasOrder">
                            <h3>
                                Order: {{ order_items.order_number }}
                            </h3>
                            <div v-for="(data, i) in order_items.order_details" :key="i + data.pizza_number">
                                <p class="mt-2"><b>Pizza</b> {{ data.pizza_number }}, {{ data.size }}, {{ data.crust }}, {{ data.type }}</p>

                                <ul class="mb-3" v-for="(data, i) in data.toppings" :key="i + data.topping_number">
                                    <li>
                                        Toppings {{ data.area }}
                                        <ul v-for="(data, i) in data.topping_items" :key="i + data.name">
                                            <li>{{ data.name }}</li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </b-field>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { saveOrderItem } from '../../../shared/api.services';
    export default {
        data() {
            return {
                hasError: false,
                pizza_order: '',
                messageError: [],
                order_items: [],
                hasOrder: false,
            }
        },
        methods:
        {
            createOrders() {
                this.pizza_order = `{order number=""}
                {pizza number="1"}
                    {size}large{\\size}
                    {crust}hand-tossed{\\crust}
                    {type}custom{\\type}
                        {toppings area="0"}
                            {item}pepperoni{\\item}
                            {item}extra cheese{\\item}
                        {\\toppings}
                        {toppings area="1"}
                            {item}sausage{\\item}
                        {\\toppings}
                        {toppings area="2"}
                            {item}mushrooms{\\item}
                        {\\toppings}
                    {\\pizza}
                        {pizza number="2"}
                        {size}medium{\\size}
                    {crust}deep dish{\\crust}
                        {type}pepperoni feast{\\type}
                        {\\pizza}
                    {\\order}`;
            },
            getOrder(order) {
                const validation = this.validateOrder(order);

                this.$refs['order_display'].innerHTML = validation === 'valid' ? this.parseOrder(order) : validation;
            },

            parseOrder(pmlOrder) {
                const xml = this.convertToXml(pmlOrder);
                const order = xml.getElementsByTagName('order')[0];

                let order_pizza = [];
                let pizzas = order.getElementsByTagName('pizza');
                if (pizzas.length) {

                    for (let i = 0; i < pizzas.length; i++) {
                        const pizza = pizzas[i];
                        const size = pizza.getElementsByTagName('size')[0].textContent;
                        const crust = pizza.getElementsByTagName('crust')[0].textContent;
                        const pizzaType = pizza.getElementsByTagName('type')[0].textContent;

                        let custom_toppings = [];
                        if (pizzaType.toLowerCase() === 'custom') {
                            const toppingAreas = pizza.getElementsByTagName('toppings');

                            if (toppingAreas.length) {

                                for (let j = 0; j < toppingAreas.length; j++) {
                                    const toppingArea = toppingAreas[j];

                                    let custom_item = [];
                                    const toppings = toppingArea.getElementsByTagName('item');
                                    if (toppings.length) {
                                        for (let k = 0; k < toppings.length; k++) {
                                            custom_item.push({
                                                'topping': toppings[k].textContent,
                                            });
                                        }
                                    }

                                    custom_toppings.push({
                                        'area': this.pizzaDetails.toppingAreas[toppingArea.getAttribute('area')],
                                        custom_item,
                                    });
                                }
                            }
                        }

                        order_pizza.push({
                            pizza_number: pizza.getAttribute('number'),
                            size: size,
                            crust: crust,
                            pizza_type: pizzaType,
                            custom_toppings
                        })
                    }
                }

                this.storeData(order.getAttribute('number'), order_pizza)
                return parsedString;

            },

            async storeData(order_number, order_pizza) {
                const form = {
                    order_items: {
                        order_number: order_number,
                        order_pizzas: order_pizza
                    }

                }
                const res = await this.callApi("post",'orders', form);
                if (res.status === 200) {
                    this.toastNotif(res.data.message, 'is-success')
                    this.order_items = res.data.results;
                    this.hasError = false;
                    this.hasOrder = true;
                } else {
                    this.hasError = true
                    if (res.status === 422) {
                        for (let i in res.data.errors) {
                            this.messageError.push(res.data.errors['order_items.order_number'][0]);
                        }
                    }
                }
            },
            formSubmit() {
                const res = this.getOrder(this.pizza_order);
            }
        },
        mounted() {
            this.createOrders();
        }
    }
</script>
