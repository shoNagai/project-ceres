<template>
  <div class="container">
    <div class="column is-8 is-offset-2">
      <div class="field is-horizontal">
        <div class="field-label is-normal">
          <label class="label">Title</label>
        </div>
        <div class="field-body">
          <div class="field">
            <div class="control">
              <input class="input" type="text" name="title" id="title" placeholder="title input" v-model="title">
            </div>
          </div>
        </div>
      </div>
      <div class="field is-horizontal">
        <div class="field-label is-normal">
          <label class="label">Content</label>
        </div>
        <div class="field-body">
          <div class="field">
            <div class="control">
              <textarea class="textarea" name="content" id="content" placeholder="Add a content..." v-model="content"></textarea>
            </div>
          </div>
        </div>
      </div>
      <div class="field is-horizontal">
        <div class="field-label">
          <!-- Left empty for spacing -->
        </div>
        <div class="field-body">
          <div class="field">
            <div class="control">
              <button class="button is-primary" @click="postKnowledge">Post knowledge</button>
            </div>
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
      title: 'edit'
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
    store.commit('menu/resetMenu')
  },
  mounted () {
    console.log('dispatching registerWeb3')
    this.$store.dispatch('web3/registerWeb3').then(() => {
      console.log('dispatching getContractInstance')
      this.$store.dispatch('contract/getContractInstance')
    })
  },
  methods: {
    postKnowledge() {
      this.message = "Transaction started";
      console.log("call methods postKnowledge")
      this.$store.state.contract.contractInstance().postKnowledge(this.title, this.content, {
        from: this.$store.state.web3.coinbase,
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