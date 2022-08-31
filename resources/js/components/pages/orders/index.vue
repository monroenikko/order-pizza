<template>
    <div class="card">
        <header class="card-header">
            <p class="card-header-title">
                {{ this.$route.name }}
            </p>

        </header>
        <div class="card-content">
            <Pagination
                :pageInfo="pageInfo.pagination"
                @change ="getOrders"
            />
            <div class="content mt-5">

                <div class="row pb-5">
                    <div class="col-md-4">
                        <b-field label="Size, Crust, Type and/or Number of Toppings">
                            <search></search>
                        </b-field>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3 d-lg-flex" v-for="(data, i) in orders" :key="i+data.order_number">
                        <div class="card mt-3">
                            <div class="card-content">
                                <div class="content">
                                    <h3>
                                        Order: {{ data.order_number }}
                                    </h3>
                                    <div v-for="(data, i) in data.order_details" :key="i + data.pizza_number">
                                        <p class="mt-2"><b>Pizza</b> {{ data.pizza_number }}, {{ data.size }}, {{ data.crust }}, {{ data.type }}</p>

                                        <ul class="mb-3" v-for="(data, i) in data.toppings" :key="i + data.topping_number">
                                            <li>
                                                Toppings {{ data.area }}
                                                <ul class="mb-0" v-for="(data, i) in data.topping_items" :key="i + data.name">
                                                    <li>{{ data.name }}</li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</template>

<script>
import { getOrderItemsAsync } from '../../../shared/api.services';
import Search from '../../components/Search.vue';
import Pagination from '../../components/Pagination.vue';
export default {
    components: {
        Search,
        Pagination
    },
    data() {
        return {
            orders: {},
            pageInfo: [],
            defaultSortDirection: 'asc',
            sortIcon: 'arrow-up',
            sortIconSize: 'is-small',
            paginate: 12,
        }
    },
    methods:{
        async getOrders(page = 1) {
            let search = '';
            const res = await getOrderItemsAsync(search, page, this.paginate);
            if(res.status === 200){
                // console.log(res.data.results.data);
                this.orders = res.data.results.data;
                this.pageInfo = res.data.results;
            }else{
                this.notif('error occured.', 'is-danger');
                // console.log(res.data.errors);
            }
        },
        async getSearchDataList() {
            let search = this.$store.getters['search/getSearch'];
            const res = await getOrderItemsAsync(search);
            if(res.status === 200){
                this.orders = res.data.results.data;
                this.pageInfo = res.data.results;
            }else{
                // console.log(res.data.errors);
            }
        },
    },
    mounted() {
        Fire.$on('searching', () =>{
            this.getSearchDataList()
        });
        this.getOrders();
    }
}
</script>
