pragma solidity ^0.4.24;

import './base/Level.sol';
import './VentureCapital.sol';

contract VentureCapitalFactory is Level {
  function createInstance(address _player) public payable returns (address) {
    _player;
    require(msg.value >= 1 ether);
    VentureCapital vc = (new VentureCapital).value(1 ether)();
    return vc;
  }

  function validateInstance(address _instance, address _player) public returns (bool) {
    _player;
    return address(_instance).balance == 0;
  }
}
