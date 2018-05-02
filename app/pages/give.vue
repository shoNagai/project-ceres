<template>
  <div class="columns">
    <div class="column"/>
    <div class="column">
      <div class="container">
        <section class="hero is-bold">
          <div class="hero-body">
            <h1 class="title is-size-2">
              Give
            </h1>
            <h2 class="subtitle is-size-4">
              You can give to team member.
            </h2>
          </div>
          <div class="columns">
            <div class="column  is-half">
                    <input class="input" type="text" name="address" id="address" placeholder="Text input" v-model="address">
            </div>
            </div>
          <div class="field">
                <p class="control">
                  <textarea class="textarea" name="message" id="message" placeholder="Add a comment..." v-model="message"></textarea>
                </p>
              </div>
              <nav class="level">
                <div class="level-left">
                  <div class="level-item">
                    <a class="button is-dark" @click="doGive">Submit</a>
                  </div>
                </div>
              </nav>
        </section>
      </div>
      </div>
    <div class="column"/>
  </div>
</template>

<script>
export default {
  data() {
    return {
      address: null,
      message: null,
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
    doGive() {
      console.log("call methods doGive")
    }
  }
}
</script>