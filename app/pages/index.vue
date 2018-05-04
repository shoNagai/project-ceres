<template>
  <div class="container has-text-centered">
    <h1 class="title">
      Thoth
    </h1>
    <h2 class="subtitle">
      thoth is a place of new knowledge sharing using  blockchains
    </h2>
  </div>
</template>

<script>
export default {
  head() {
    return {
      title: 'top'
    }
  },
  fetch ({store}) {
    store.commit('menu/resetMenu')
  }
}
</script>