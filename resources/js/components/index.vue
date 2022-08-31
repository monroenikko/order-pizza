<template>
    <div>
        <nav-bar/>
        <div class="container pl-xl-5 mt-5">
            <router-view/>
        </div>
    </div>
</template>

<script>
import NavBar from './layouts/NavBar.vue'

export default {
  watch: {
  },
    components:{
        NavBar
    },
    setup() {

    },
}
</script>
