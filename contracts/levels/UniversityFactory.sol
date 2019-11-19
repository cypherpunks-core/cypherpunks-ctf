pragma solidity ^0.4.18;

import "./base/Level.sol";
import "./University.sol";

contract UniversityFactory is Level {
  function createInstance(address _player) public payable returns (address) {
    bytes32[6] memory data;
    data[0] = stringToBytes32("National Taiwan University");
    data[1] = stringToBytes32("National Tsing Hua University");
    data[2] = stringToBytes32("National Yang Ming University");
    data[3] = stringToBytes32("National Cheng Kung University");
    data[4] = stringToBytes32("National Chiao Tung University");
    data[5] = stringToBytes32("National Cheng Chi University");
    _player;
    return new University(data);
  }

  function validateInstance(address _instance, address _player)
    public
    returns (bool)
  {
    _player;
    University instance = University(_instance);
    return instance.combined();
  }

  function stringToBytes32(string memory _name) public returns (bytes32 name) {
    bytes memory tmp = bytes(_name);

    if (tmp.length == 0) {
      return 0x0;
    }

    assembly {
      name := mload(add(_name, 32))
    }
  }
}
