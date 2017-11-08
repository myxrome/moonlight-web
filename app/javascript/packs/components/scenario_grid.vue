<template lang="pug">
    .grid-x.grid-margin-x
        .medium-6.large-4.cell(v-for='item in scenarios' :key='item.id')
            .card
                .card-section
                    h4 {{ item.title }}
                    p {{ item.description }}
                    hr
                    a.button.float-right(:href='item.key + "/play"')
                        i.fi-play
                        |
                        | PLAY
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
                this.scenarios = response.data.sort((left, right) => {
                    return left.order - right.order;
                });
            })
        }
    }
</script>