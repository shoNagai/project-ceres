<template>
  <div class="container">
    <div class="column is-8 is-offset-2">
      <div class="card article"  v-for="(knowledge, key, index) in knowledges" :key="index"  >
        <div class="card-content">
          <div class="media">
            <router-link :to="`/knowledges/detail/${knowledge.id}`">
              <p>{{ knowledge.title }}</p>
            </router-link>
          </div>
          <div class="content article-body">
            <p>Referred: {{ knowledge.numReferred }}</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  head() {
    return {
      title: 'list'
    }
  },
  data() {
    return {
      knowledges: [],
    }
  },
  fetch ({store}) {
    store.commit('menu/resetMenu')
  },
  mounted () {
    console.log("call methods getAllKnowledges")
    this.$store.state.contract.contractInstance().getAllKnowledges({
      from: this.$store.state.web3.coinbase
    }, (err, result) => {
      if (err) {
        console.log('getAllKnowledges is error')
        console.log(err)
      } else {
        console.log('getAllKnowledges is success')
        for (var i = 0; i < result.length; i++) {
          this.getKnowledge(result[i])
        }
      }
    }) 
  },
  methods: {
    getKnowledge(knowledgeId) {
      console.log("call methods getKnowledge")
      this.$store.state.contract.contractInstance().getKnowledge(knowledgeId, {
        from: this.$store.state.web3.coinbase
      }, (err, result) => {
        if (err) {
          console.log('getKnowledge is error')
          console.log(err)
        } else {
          console.log('getKnowledge is success')
          var knowledge = {
            "id": null,
            "title": null,
            "content": null,
            "numReferred": null,
          }
          knowledge.id = knowledgeId
          knowledge.title = result[0].toString()
          knowledge.content = result[1].toString()
          knowledge.numReferred = result[2].toString()
          this.knowledges.push(knowledge)
        }
      }) 
    }
  }
}
</script>

<style>
.card-content{padding:1.5rem}
</style>