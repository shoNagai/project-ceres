<template>
  <section class="hero is-dark is-large is-bold">
  <div class="hero-head">
    <nav class="navbar">
      <div class="container">
        <div class="navbar-brand">
          <nuxt-link to="/" class="navbar-item">
            <!-- <img src="https://bulma.io/images/bulma-type-white.png" alt="Logo"> -->
            Thoth
          </nuxt-link>
          <span class="navbar-burger burger" data-target="navbarMenuHeroB" @click="$store.commit('toggleMenu')" :class="{'is-active': $store.state.isMenuActive}">
            <span></span>
            <span></span>
            <span></span>
          </span>
        </div>
        <div id="navbarMenuHeroB" class="navbar-menu"  :class="{'is-active': $store.state.isMenuActive}">
          <div class="navbar-end">
            <nuxt-link to="/" class="navbar-item ">Top</nuxt-link>
            <nuxt-link to="/give" class="navbar-item">Give</nuxt-link>
            <nuxt-link to="/contact" class="navbar-item">Contact</nuxt-link>
          </div>
        </div>
      </div>
    </nav>
  </div>
</section>
</template>

<script>
export default {
  methods: {
      setActive(){
          Vue.set(this.$data, 'isActive', true)
      }
  }
}
</script>