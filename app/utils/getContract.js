import Web3 from 'web3'
import {address, abi} from './constants/contract'

let getContract = new Promise(function (resolve, reject) {
  let web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:8545"))
  let contract = new web3.eth.contract(abi)
  let contractInstance = contract.at(address)
  resolve(contractInstance)
})

export default getContract