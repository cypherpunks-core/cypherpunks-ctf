pragma solidity ^0.4.18;

import './base/Level.sol';
import './CrosslinkShip.sol';

contract CrosslinkShipFactory is Level {

  function createInstance(address _player) public payable returns (address) {
    _player;
    return new CrosslinkShip();
  }

  function validateInstance(address _instance, address _player) public returns (bool) {
    _player;
    CrosslinkShip instance = CrosslinkShip(_instance);
    return instance.htcIsHauled();
  }
}

