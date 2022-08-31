import Vue from 'vue';
import Router from 'vue-router';
Vue.use(Router)

const page = path => () =>
    import (`./components/pages/${path}`).then(m => m.default || m);

const routes = [{
        path: '/',
        name: 'Home',
        component: page('home/index.vue'),
    },
    {
        path: '/orders',
        name: 'Orders',
        component: page('orders/index.vue'),
    }
]

const router = new Router({
    mode: 'history',
    linkActiveClass: 'is-active',
    routes,
    scrollBehavior() {
        return { x: 0, y: 0 }
    }
})

export default router;