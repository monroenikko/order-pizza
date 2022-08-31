<template>
    <div>
        <b-input placeholder="Search..." type="search" icon="fas fa-search" @input="searchData" v-model="search"/>
    </div>
</template>
<script>
export default {
    name: 'Search',
    data(){
        return {
            search: null,
        }
    },
    methods: {
        searchData() {
            this.$store.dispatch('search/searchData', this.search)
        },
    },
    watch: {
        search: {
            handler: _.debounce(function () {
                Fire.$emit('searching');
            }, 1000)
        }
    },
}
</script>
