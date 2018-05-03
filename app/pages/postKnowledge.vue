<template>
  <div class="container">
    <div class="column is-8 is-offset-2">
      <section class="hero is-bold">
        <div class="hero-body">
          <h1 class="title is-size-2">
            Post Knowledge
          </h1>
          <h2 class="subtitle is-size-4">
            You can post your knowledge for the world.
          </h2>
        </div>
        <div class="columns">
          <div class="column  is-half">
                  <input class="input" type="text" name="title" id="title" placeholder="title input" v-model="title">
          </div>
          </div>
          <div class="field">
            <p class="control">
              <textarea class="textarea" name="content" id="content" placeholder="Add a content..." v-model="content"></textarea>
            </p>
          </div>
          <nav class="level">
            <div class="level-left">
              <div class="level-item">
                <a class="button is-dark" @click="postKnowledge">Submit</a>
              </div>
            </div>
          </nav>
          <div >
            <div class="message" v-if="message">{{message}}</div>
            <div class="tx_hash" v-if="tx_hash">Tx Hash: <a v-bind:href="tx_url">{{tx_hash}}</a></div>
          </div>
      </section>
    </div>
  </div>
</template>

<script>
export default {
  head() {
    return {
      title: 'post'
    }
  },
  data() {
    return {
      title: null,
      content: null,
      message: null,
      tx_hash: null,
      tx_url: null,
    }
  },
  fetch ({store}) {
    store.commit('resetMenu')
  },
  mounted () {
    console.log('dispatching registerWeb3')
    this.$store.dispatch('web3/registerWeb3')
    console.log('dispatching getContractInstance')
    this.$store.dispatch('contract/getContractInstance')
  },
  methods: {
    postKnowledge() {
      this.message = "Transaction started";
      console.log("call methods postKnowledge")
      this.$store.state.contract.contractInstance().postKnowledge(this.title, this.content, {
        from: this.$store.state.web3.account[0],
        gas: 500000
      }, (err, result) => {
        if (err) {
          console.log('postKnowledge is error')
          console.log(err)
          this.message = "Transaction failed"
        } else {
          console.log('postKnowledge is success')
          console.log(result)
          this.message = "Transaction result"
          this.title = null
          this.content = null
        }
      })
    }
  }
}
</script>