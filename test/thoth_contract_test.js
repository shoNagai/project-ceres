var ThothContract = artifacts.require("./ThothContract.sol");

contract('ThothContractTest', function(accounts) {
  it("should assert true", function(done) {
    var thoth_contract_test = ThothContract.deployed();
    assert.isTrue(true);
    done();
  });
});
