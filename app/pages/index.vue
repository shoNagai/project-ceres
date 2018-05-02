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
  fetch ({store}) {
    store.commit('resetMenu')
  }
}
</script>