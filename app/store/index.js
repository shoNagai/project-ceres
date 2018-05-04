import Vue from 'vue'
import Vuex from 'vuex'
import contract from './modules/contract'
import menu from './modules/menu'
import user from './modules/user'
import web3 from './modules/web3'

Vue.use(Vuex)

export default () =>
  new Vuex.Store({
    modules: {
      contract,
      menu,
      user,
      web3
    }
  })