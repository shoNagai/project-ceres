import getContract from '../../utils/getContract'

const namespaced = true

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
    }).catch(err => {
      console.log(err);
    });
  }
}

export default {
  namespaced,
  state,
  actions,
  mutations
}