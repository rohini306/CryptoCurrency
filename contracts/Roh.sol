pragma solidity ^0.5.0;

contract Roh {
//a contructor--set the value of initial number of tokens that we will haver
//Set the total number of tokens
//read the total number of tokens


mapping(address=>uint256) public balanceOf;
mapping(address=>mapping(address=>uint256)) public allowance;
uint256 public totalSupply;

event Transfer(
  address indexed _from,
  address indexed _to,
  uint256 _value
  );

  event Approval(

   address indexed _owner,
   address indexed _spender,
   uint256 _value
    );
//name

//we also need to build a trnasfer event

string public name="Roh";
string public symbol="Ro";
string public standard="Roh v1.0";
//symbol
//we need to build an allowance


constructor(uint256 _initialSupply) public {

balanceOf[msg.sender]=_initialSupply;
totalSupply=_initialSupply;


}
//transfer fn


function transfer(address _to,uint256 _value) public returns (bool success)
{
  //exception if account doesn have enough
require(balanceOf[msg.sender] >= _value);


//trnasfer the balance
balanceOf[msg.sender]-=_value;
balanceOf[_to]+=_value;

  //transfer event
emit Transfer(msg.sender,_to,_value);
  //return a booolean
  return true;
}
//delegate transfer--> one function will allow our account to approve the transfers, and other with handle the delegated transfer-one account to other without the sender mentioning

  //we want an approve function

//aaprove account spender to send value tokens
  function approve(address _spender, uint256 _value) public returns(bool success){

    //allowance
    allowance[msg.sender][_spender]=_value;
    //approve event
    emit Approval(msg.sender,_spender,_value);
    return true;
  }
  //we want a transfer from function this fn allows us to handle this delegated transfers

  function transferFrom(address _from,address _to,uint256 _value) public returns(bool success){

//add some requirements- that from has enough tokenInstance
require(_value<=balanceOf[_from]);
//require that the allowance is big enough
require(_value<=allowance[_from][msg.sender]);

//change the balanceOf
balanceOf[_from]-=_value;
balanceOf[_to]+=_value;
//update the allowance
allowance[_from][msg.sender]-=_value;
//call the transfer event
emit Transfer(_from,_to,_value);

    //return a booolean
    return true;
  }






}
