<template>
  <section class="hero is-large">
    <div class="hero-body">
    <div class="container has-text-centered">
      <h1 class="title">
        Thoth
      </h1>
      <h2 class="subtitle">
        thoth is a place of new knowledge sharing using  blockchains
      </h2>
    </div>
  </div>
  </section>
</template>

<script>
export default {
  // ログイン認証する場合：各ページに認証チェックも必要
  // layout (context) {
  //   return 'top'
  // },
  head() {
    return {
      title: 'top'
    }
  },
  fetch ({store}) {
    store.commit('resetMenu')
  }
}
</script>