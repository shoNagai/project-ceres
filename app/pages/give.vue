<template>
  <section class="hero is-bold">
    <div class="hero-body">
      <h1 class="title is-size-2">
        Give
      </h1>
      <h2 class="subtitle is-size-4">
       You can give to team member.
      </h2>
    </div>
  </section>
</template>

<script>
export default {
  fetch ({store}) {
    store.commit('resetMenu')
  },
  mounted () {
    console.log('dispatching getContractInstance')
    this.$store.dispatch('contract/getContractInstance')
  }
}
</script>