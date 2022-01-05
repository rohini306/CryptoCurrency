const Roh = artifacts.require("./Roh.sol");

module.exports = function(deployer) {
  deployer.deploy(Roh,1000000);
};
