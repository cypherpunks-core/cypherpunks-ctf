pragma solidity ^0.4.18;

import './base/Level.sol';
import './Bank.sol';

contract BankFactory is Level {

  uint supply = 14657921;
  uint playerSupply = 29;

  function createInstance(address _player) public payable returns (address) {
    Bank bank = new Bank(supply);
    bank.transfer(_player, playerSupply);
    return bank;
  }

  function validateInstance(address _instance, address _player) public returns (bool) {
    Bank bank = Bank(_instance);
    return bank.balanceOf(_player) > playerSupply;
  }
}
