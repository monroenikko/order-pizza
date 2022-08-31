<template>
    <b-navbar :shadow="true" class="is-fixed-top">

        <template #brand>
            <b-navbar-item tag="router-link" :to="{ path: '/' }">
                <b>PIZZA TEST</b>
            </b-navbar-item>
        </template>
        <template #start>
            <b-navbar-item tag="router-link" exact to="/">
                Home
            </b-navbar-item>
            <b-navbar-item tag="router-link" to="/orders">
                Orders
            </b-navbar-item>
        </template>

    </b-navbar>
</template>
