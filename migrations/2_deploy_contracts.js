const Roh = artifacts.require("./Roh.sol");
const RohSale=artifacts.require("./RohSale.sol")
module.exports = function(deployer) {
  deployer.deploy(Roh,1000000).then(function(){
   var tokenPrice=1000000000000000;
    return deployer.deploy(RohSale,Roh.address,tokenPrice);
  });

};
