pragma solidity ^0.4.24;

contract GuardLibrary {
  bool public complete;
}

contract StrongBox {
  address public guardLib;

  constructor(address _guardLibrary) public {
    guardLib = _guardLibrary;
  }

  function pass() public view returns (bool) {
    return GuardLibrary(guardLib).complete();
  }
}
