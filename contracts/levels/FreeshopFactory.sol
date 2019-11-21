pragma solidity ^0.4.24;

import "./base/Level.sol";
import "./Freeshop.sol";

contract FreeshopFactory is Level {
  function createInstance(address _player) public payable returns (address) {
    _player;
    require(msg.value >= 1 ether);
    Freeshop nowinstance = new Freeshop();
    address(nowinstance).transfer(msg.value);
    return nowinstance;
  }

  function validateInstance(address _instance, address _player)
    public
    returns (bool)
  {
    _player;
    Freeshop instance = Freeshop(_instance);
    return instance.getBalance() == 0 ether;
  }
}
