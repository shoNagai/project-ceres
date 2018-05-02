import getContract from '../utils/getContract'

export const state = () => ({
  contractInstance: null
})

export const mutations = {
  registerContractInstance (state, payload) {
    console.log('contract instance: ', payload)
    state.contractInstance = () => payload
  }
}

export const actions = {
  getContractInstance ({commit}) {
    getContract.then(result => {
      commit('registerContractInstance', result)
    }).catch(e => console.log(e))
  }
}