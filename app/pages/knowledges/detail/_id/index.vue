<template>
  <div class="container">
    <div class="tile is-ancestor">
    <div class="tile is-parent is-8 is-shady">
      <article class="tile is-child notification is-white">
        <p class="title">{{ title }}</p>
        <div class="content">
          <p>{{ content }}</p>
        </div>
        <a class="button is-success is-rounded" @click="referred">like</a>
      </article>
    </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      id:null,
      title: null,
      content: null,
    }
  },
  fetch ({store}) {
    store.commit('menu/resetMenu')
  },
  mounted () {
    console.log("call methods getKnowledge")
    const { id } = this.$route.params
    this.$store.state.contract.contractInstance().getKnowledge(id, {
      from: this.$store.state.web3.coinbase
    }, (err, result) => {
      if (err) {
        console.log('getKnowledge is error')
        console.log(err)
      } else {
        console.log('getKnowledge is success')
        // var knowledge = {
        //   "id": null,
        //   "title": null,
        //   "content": null,
        //   "numReferred": null,
        // }
        this.id = id
        this.title = result[0].toString()
        this.content = result[1].toString()
        // knowledge.numReferred = result[2].toString()
        // this.knowledges = knowledge
      }
    }) 
  },
  methods: {
    referred() {
      this.message = "Transaction started";
      console.log("call methods referred")
      this.$store.state.contract.contractInstance().referred(this.id, {
        from: this.$store.state.web3.coinbase,
        gas: 500000
      }, (err, result) => {
        if (err) {
          console.log('referred is error')
          console.log(err)
          this.message = "Transaction failed"
        } else {
          console.log('referred is success')
          console.log(result)
          this.message = "Transaction result"
        }
      })
    }
  }
}
</script>