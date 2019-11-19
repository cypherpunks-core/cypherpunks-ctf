pragma solidity ^0.4.24;

import "./base/Level.sol";
import "./Encrypt.sol";

contract EncryptFactory is Level {
  function createInstance(address _player) public payable returns (address) {
    _player;
    return new Encrypt();
  }

  function validateInstance(address _instance, address _player)
    public
    returns (bool)
  {
    _player;
    Encrypt instance = Encrypt(_instance);
    return instance.pass();
  }
}
