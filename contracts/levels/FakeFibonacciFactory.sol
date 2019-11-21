pragma solidity ^0.4.24;

import "./base/Level.sol";
import "./FakeFibonacciBank.sol";

contract FakeFibonacciFactory is Level {
  function createInstance(address _player) public payable returns (address) {
    _player;
    require(msg.value >= 1 ether);
    FakeFibonacciLib lib = new FakeFibonacciLib();
    FakeFibonacciBank bank = (new FakeFibonacciBank).value(1 ether)(
      address(lib)
    );
    return bank;
  }

  function validateInstance(address _instance, address _player)
    public
    returns (bool)
  {
    _player;
    return address(_instance).balance == 0;
  }
}
