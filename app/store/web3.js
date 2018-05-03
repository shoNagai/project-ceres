import getWeb3 from '../utils/getWeb3'

export const state = () => ({
  isInjected: false,
  web3Instance: null,
  account: null,
  error: null
})

export const mutations = {
  registerWeb3Instance (state, payload) {
    console.log('registerWeb3instance Mutation being executed', payload)
    let result = payload
    state.account = result.account
    state.isInjected = result.injectedWeb3
    state.web3Instance = result.web3
  }
}

export const actions = {
  registerWeb3 ({commit}) {
    console.log('registerWeb3 Action being executed')
    getWeb3.then(result => {
      console.log('committing result to registerWeb3Instance mutation')
      commit('registerWeb3Instance', result)
    }).catch(e => {
      console.log('error in action registerWeb3', e)
    })
  }
}