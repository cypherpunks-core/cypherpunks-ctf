pragma solidity ^0.4.24;

contract Encrypt {
  bytes32 private sault = "Crosslink 2019";
  bool public complete;

  function guess(uint256 _key) public {
    bytes32 time1 = bytes32(block.timestamp);
    bytes32 entropy1 = keccak256(abi.encodePacked(time1));

    bytes32 time2 = bytes32(block.timestamp);
    bytes32 entropy2 = keccak256(abi.encodePacked(time2));

    bytes32 target = ((entropy1 ^ entropy2) &
      keccak256(abi.encodePacked(block.number))) &
      sault;
    complete = (target == bytes32(_key));
  }

  function pass() public view returns (bool) {
    return complete;
  }
}
