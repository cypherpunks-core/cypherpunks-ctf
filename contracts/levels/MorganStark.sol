pragma solidity ^0.4.24;

contract MorganStark {
  address owner;
  uint256 public balance;

  constructor() public payable {
    require(msg.value == 0);
    owner = msg.sender;
  }

  function collegeFund() public payable {
    require(msg.sender == owner);
    balance += msg.value;
  }

  function checkBalance() public view returns (uint256) {
    return address(this).balance;
  }
}
