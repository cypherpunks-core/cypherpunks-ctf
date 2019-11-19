pragma solidity ^0.4.24;

import 'zeppelin-solidity/contracts/ownership/Ownable.sol';
import './base/Level.sol';
import './Dragon.sol';

contract DragonFactory is Ownable, Level {
  address[] owner;
  address[] dragonDen;
  
  function createInstance(address _player) public payable returns (address) {
    _player;
    uint8 r1 = random1();
    uint8 r2 = random2();
    return new Dragon(owner[r1], dragonDen[r2]);
  }

  function validateInstance(address _instance, address _player) public returns (bool) {
    _player;
    Dragon instance = Dragon(_instance);
    return instance.complete();
  }

  function random1() public returns(uint8) {
    return uint8(uint256(keccak256(block.timestamp - 4, block.difficulty)) % owner.length);
  }
  
  function random2() public returns(uint8) {
    return uint8(uint256(keccak256(block.timestamp - 2, block.difficulty)) % owner.length);
  }
  
  function setAccount(address _owner, address _dragonDen) public onlyOwner {
      owner.push(_owner);
      dragonDen.push(_dragonDen);
  }
}
