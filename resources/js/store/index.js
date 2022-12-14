import Vue from 'vue';
import Vuex from 'vuex';
Vue.use(Vuex)

import { search } from './modules/search/search.js';

export default new Vuex.Store({
    modules: {
        search
    }
})