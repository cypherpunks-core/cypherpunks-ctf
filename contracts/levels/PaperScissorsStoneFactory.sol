pragma solidity ^0.4.24;

import './base/Level.sol';
import './PaperScissorsStone.sol';

contract PaperScissorsStoneFactory is Level {

  function createInstance(address _player) public payable returns (address) {
    _player;
    return new PaperScissorsStone();
  }

  function validateInstance(address _instance, address _player) public returns (bool) {
    _player;
    PaperScissorsStone instance = PaperScissorsStone(_instance);
    return instance.win();
  }
  
}