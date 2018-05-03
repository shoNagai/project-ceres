var ThothContract = artifacts.require("./ThothContract.sol");

module.exports = function(deployer) {
  deployer.deploy(ThothContract);
};
