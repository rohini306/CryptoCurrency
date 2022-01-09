pragma solidity ^0.5.0;
import "./Roh.sol";
contract RohSale{
  address admin;
  Roh public tokenContract;
  uint256 public tokenPrice;
  constructor(Roh _tokenContract,uint256 _tokenPrice) public{
    //assign an admin - external account connected tot he blockchain with special powers
  admin=msg.sender;// person who deployed the contract
    //token contract-
  tokenContract=_tokenContract;
    //set token price- how much ether it will cost when we sell our token
tokenPrice=_tokenPrice;

  }
}
