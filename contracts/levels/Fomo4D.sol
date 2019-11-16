pragma solidity ^0.4.18;

contract Fomo4D {
  string public owner;

  function Fomo4D () {
    owner = "BoYu Chen";
  }
  
  function isContract (address _address) internal view returns (bool) {
    uint256 size;

    assembly { size := extcodesize(_address) }
    return size > 0;
   }
  
  function changeOwner () {
    require((msg.sender != tx.origin) && (isContract(msg.sender) == false));
    owner = "Bill Hsu";
  }
}
