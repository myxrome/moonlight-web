<template lang="pug">
    .grid-x.grid-margin-x
        .medium-6.large-4.cell(v-for='item in scenarios')
            .card
                .card-section
                    h4 {{ item.title }}
                    p {{ item.description }}
</template>

<script>
    import axios from 'axios';

    export default {
        data: function () {
            return {
                scenarios: [],
            }
        },
        created: function () {
            axios.get('/scenarios.json').then((response) => {
                this.scenarios = response.data.sort(function (left, right) {
                    return left.order - right.order;
                });
            })
        }
    }
</script>