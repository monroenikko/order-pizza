/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue').default;
import Vue from 'vue';
import router from './router';
import common from './common';
import shared from './shared/common';
import store from './store/index';

import Buefy from 'buefy'
import 'buefy/dist/buefy.css'
import VCalendar from 'v-calendar';

Vue.use(Buefy);
Vue.use(VCalendar, {
    componentPrefix: 'v',
});

axios.interceptors.request.use(request => {
    const token = window.axios.defaults.headers.common['X-CSRF-TOKEN'];
    if (token) {
        request.headers.common.Authorization = `Bearer ${token}`
    }

    const locale = store.getters['lang/locale']
    if (locale) {
        request.headers.common['Accept-Language'] = locale
    }
    return request
})

Vue.mixin(common);
Vue.mixin(shared);
window.Fire = new Vue();
Vue.component('default-app', require('./components/index.vue').default);
/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
    store,
    router,
});