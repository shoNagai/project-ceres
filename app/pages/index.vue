<template>
  <section class="hero is-large">
    <div class="hero-body">
    <div class="container has-text-centered">
      <h1 class="title">
        Title
      </h1>
      <h2 class="subtitle">
        Subtitle
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