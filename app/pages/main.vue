<template>
  <section class="hero is-bold">
    <div class="hero-body">
      <h1 class="title is-size-2">
        Main
      </h1>
      <h2 class="subtitle is-size-4">
       This is main page.
      </h2>
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