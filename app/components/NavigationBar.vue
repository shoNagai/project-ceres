<template>
  <section class="hero is-dark is-large">
  <div class="hero-head">
    <nav class="navbar">
      <div class="container">
        <div class="navbar-brand">
          <nuxt-link to="/" class="navbar-item">
            <!-- <img src="https://bulma.io/images/bulma-type-white.png" alt="Logo"> -->
            Thoth
          </nuxt-link>
          <span class="navbar-burger burger" data-target="navbarMenuHeroB" @click="$store.commit('menu/toggleMenu')" :class="{'is-active': $store.state.menu.isMenuActive}">
            <span></span>
            <span></span>
            <span></span>
          </span>
        </div>
        <div id="navbarMenuHeroB" class="navbar-menu"  :class="{'is-active': $store.state.menu.isMenuActive}">
          <div class="navbar-end">
            <nuxt-link to="/" class="navbar-item ">Top</nuxt-link>
            <nuxt-link to="/knowledgeList" class="navbar-item">List</nuxt-link>
            <nuxt-link to="/knowledgeEdit" class="navbar-item">Edit</nuxt-link>
            <nuxt-link to="/contact" class="navbar-item">Contact</nuxt-link>
            <span class="navbar-item">
              <a class="button" @click="doLogout">
                <span>Logout</span>
              </a>
            </span>
          </div>
        </div>
      </div>
    </nav>
  </div>
</section>
</template>

<script>
import { mapActions } from 'vuex'

export default {
  methods: {
    ...mapActions('user', ['logout']),
    doLogout () {
      this.logout()
        .then(() => {
          this.$router.push('/login')
        })
        .catch((err) => console.log(err))
    },
    setActive(){
      Vue.set(this.$data, 'isActive', true)
    }
  }
}
</script>