pragma solidity ^0.4.24;

import "./base/Level.sol";
import "./Fomo4D.sol";

contract Fomo4DFactory is Level {
  function createInstance(address _player) public payable returns (address) {
    _player;
    return new Fomo4D();
  }

  function validateInstance(address _instance, address _player)
    public
    returns (bool)
  {
    _player;
    Fomo4D instance = Fomo4D(_instance);

    return (
      keccak256(instance.owner()) == keccak256("Bill Hsu") ? true : false
    );
  }
}
