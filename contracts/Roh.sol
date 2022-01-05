pragma solidity ^0.5.0;

contract Roh {
//a contructor--set the value of initial number of tokens that we will haver
//Set the total number of tokens
//read the total number of tokens


mapping(address=>uint256) public balanceOf;

uint256 public totalSupply;

event Transfer(
  address indexed _from,
  address indexed _to,
  uint256 _value
  );
//name

string public name="Roh";
string public symbol="Ro";
string public standard="Roh v1.0";
//symbol



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

}
