const Roh = artifacts.require("./Roh.sol");

contract('Roh',function(accounts){
var tokenInstance;
it('initializes contract with their correct values', function(){
  return Roh.deployed().then(function(instance){
    tokenInstance=instance;
    return tokenInstance.name();
  }).then(function(name){
    assert.equal(name,'Roh','has the correct name');
    return tokenInstance.symbol();
  }).then(function(symbol){
    assert.equal(symbol,'Ro','has the correct symbol');
  });
})
it('sets total supply upon deployment', function(){

  return Roh.deployed().then(function(instance){
    tokenInstance=instance;
    return tokenInstance.totalSupply();

  }).then(function(totalSupply){
    assert.equal(totalSupply.toNumber(),1000000,'sets total supply to 1000000');
 return tokenInstance.balanceOf(accounts[0]);
}).then(function(adminBalance){
  assert.equal(adminBalance.toNumber(),1000000,'it allocates the initial supply to the admin account');
});
});

it('transfers token ownership', function(){
  return Roh.deployed().then(function(instance){
    tokenInstance=instance;
    return tokenInstance.transfer.call(accounts[1],9999999999999999);

  }).then(assert.fail).catch(function(error){
    assert(error.message.indexOf('revert'>=0),'error message must contain a revert');

   return tokenInstance.transfer.call(accounts[1],250000,{from:accounts[0]});

  }).then(function(success){
    assert.equal(success,true,'it returns true');
    return tokenInstance.transfer(accounts[1],250000,{from:accounts[0]});
  })

  .then(function(receipt){



   assert.equal(receipt.logs.length,1,'triggers one event');
   assert.equal(receipt.logs[0].event,'Transfer','should be the "transfer" event');
   assert.equal(receipt.logs[0].args._from,accounts[0],'logs the account the tokens are transfered from');
   assert.equal(receipt.logs[0].args._to,accounts[1],'logs the account the tokens are transfered to');
   assert.equal(receipt.logs[0].args._value,250000,'logs the transfer amount');



    return tokenInstance.balanceOf(accounts[1]);

  }).then(function(balance){
    assert.equal(balance.toNumber(),250000,'adds the amount to receiving account');
    return tokenInstance.balanceOf(accounts[0]);
  }).then(function(balance){
    assert.equal(balance.toNumber(),750000,'deducts the amount from the sending account')
  })
});






});
