pragma solidity ^0.4.24;

import "./base/Level.sol";
import "./MorganStark.sol";

contract MorganStarkFactory is Level {
  function createInstance(address _player) public payable returns (address) {
    _player;
    return new MorganStark();
  }

  function validateInstance(address _instance, address _player)
    public
    returns (bool)
  {
    _player;
    MorganStark instance = MorganStark(_instance);
    return instance.checkBalance() > 0;
  }
}
