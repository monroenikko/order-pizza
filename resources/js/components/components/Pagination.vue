<template>
    <div>
        <b-pagination
            v-model="pageInfo.current_page"
            :total="pageInfo['total']"
            :per-page="pageInfo.per_page"
            :range-before="rangeBefore"
            :range-after="rangeAfter"
            :order="order"
            :size="size"
            :simple="isSimple"
            :rounded="isRounded"
            :icon-prev="prevIcon"
            :icon-next="nextIcon"
            aria-next-label="Next page"
            aria-previous-label="Previous page"
            aria-page-label="Page"
            aria-current-label="Current page"
            @change="changePage(pageInfo)"
        >
        </b-pagination>
    </div>
</template>
<script>
export default {
    name: 'Pagination',
    props: [
        'pageInfo'
    ],
    data(){
        return {
            // pageInfo:{},
            rangeBefore: 3,
            rangeAfter: 1,
            order: '',
            size: '',
            isSimple: false,
            isRounded: true,
            prevIcon: 'chevron-left',
            nextIcon: 'chevron-right',
        }
    },
    methods: {
        changePage(pageInfo) {
            this.$emit('change', [pageInfo.current_page]);
        }
    },
}
</script>
