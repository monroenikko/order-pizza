export const search = {
    namespaced: true,
    state: {
        search: null,
    },
    mutations: {
        setSearch(state, payload) {
            state.search = payload
        },
    },
    getters: {
        getSearch: (state) => state.search,
    },
    actions: {
        searchData({ commit }, payload) {
            commit('setSearch', payload);
        },
    },
};