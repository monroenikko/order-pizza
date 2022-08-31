import _ from 'lodash';

export default {
    data() {
        return {}
    },
    methods: {
        async callApi(method, url, dataObj, config) {
            try {
                return await axios({
                    method: method,
                    url: '/api/' + url,
                    data: dataObj,
                    config: config
                })
            } catch (e) {
                return e.response
            }
        },
        notif(message, type, duration) {
            this.$buefy.notification.open({
                duration: 3000,
                message: message,
                type: type,
                hasIcon: true
            });
        },
        toastNotif(message, type) {
            this.$buefy.toast.open({
                message: message,
                type: type,
            });
        },
    },
    mounted() {},
    destroyed() {},
    computed: {},
}