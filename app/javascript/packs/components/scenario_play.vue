<template lang="pug">
    .grid-x.grid-margin-x(v-if='scenario')
        .cell(v-for='item in history' :key='item.key')
            .callout(:class='"stage-" + item.stage_order')
                p {{ item.mainScene.content }}
        .cell(v-if='current')
            .callout(:class='"stage-" + current.stage_order')
                p {{ current.mainScene.content }}
            a.button.float-right(v-if='this.scenario.stages.length > 0' @click.prevent='next')
                i.fi-plus
                |
                | NEXT
            a.button.float-right(v-else href='/')
                i.fi-check
                |
                | DONE

</template>

<script>
    import axios from 'axios';

    export default {
        data: function () {
            return {
                scenario: null,
                current: null,
                history: [],
            }
        },
        methods: {
            next() {
                if (this.current !== null) {
                    this.history.push(this.current);
                }
                const stage = this.scenario.stages[0];
                this.current = {
                    stage_order: stage.order,
                    key: Math.random() * 10000,
                    mainScene: stage.scenes.splice(Math.floor(Math.random() * stage.scenes.length), 1)[0],
                    altScene: stage.scenes.splice(Math.floor(Math.random() * stage.scenes.length), 1)[0],
                };
                if (stage.scenes.length === 0) {
                    this.scenario.stages.splice(0, 1);
                }
            },
        },
        created: function () {
            const url = new URL(document.URL);
            axios.get(`/scenarios${url.pathname}.json`).then((response) => {
                response.data.stages.sort((left, right) => {
                    return left.order - right.order;
                });
                this.scenario = response.data;
                this.next();
            })
        }
    }
</script>