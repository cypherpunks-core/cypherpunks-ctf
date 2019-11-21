pragma solidity ^0.4.24;

import "./base/Level.sol";
import "./StrongBox.sol";
import "./Guard.sol";

contract StrongBoxFactory is Level {
  function createInstance(address _player) public payable returns (address) {
    _player;
    Guard guard = new Guard();
    StrongBox sb = new StrongBox(guard);
    return sb;
  }

  function validateInstance(address _instance, address _player)
    public
    returns (bool)
  {
    _player;
    StrongBox sb = StrongBox(_instance);
    return sb.pass();
  }
}
