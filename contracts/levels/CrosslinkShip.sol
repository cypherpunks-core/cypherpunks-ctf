pragma solidity ^0.4.24;

contract CrosslinkShip {
  bool public htcIsHauled = false;
  address public anchor = 0x0;

  function sailAway() public {
    require(anchor != 0x0);

    uint256 size = 0;
    address a = anchor;
    assembly {
      size := extcodesize(a)
    }
    if (size > 0) {
      revert(); // it is too early to sail away
    }

    htcIsHauled = true;
  }

  function pullAnchor() public {
    if (anchor != 0x00) {
      require(anchor.call()); // raise the anchor if the ship is ready to sail away
    }
  }

  function dropShipAnchor(uint256 blockNumber) public returns (address addr) {
    // the ship will be able to sail away in 50k blocks time
    require(blockNumber > block.number + 50000);

    // if(block.number < blockNumber) { throw; }
    // suicide(msg.sender);
    uint256[8] memory a;
    a[0] = 0x6300;
    a[1] = blockNumber;
    a[2] = 0x43;
    a[3] = 0x10;
    a[4] = 0x58;
    a[5] = 0x57;
    a[6] = 0x33;
    a[7] = 0xff;

    uint256 code = assemble(a);

    // init code to deploy contract
    uint256[8] memory b;
    b[0] = 0;
    b[1] = 0x6a;
    b[2] = code;
    b[3] = 0x6000;
    b[4] = 0x52;
    b[5] = 0x600b;
    b[6] = 0x6015;
    b[7] = 0xf3;

    uint256 initcode = assemble(b);
    uint256 sz = getSize(initcode);
    uint256 offset = 32 - sz;

    assembly {
      let solidity_free_mem_ptr := mload(0x40)
      mstore(solidity_free_mem_ptr, initcode)
      addr := create(0, add(solidity_free_mem_ptr, offset), sz)
    }

    require(addr != 0x0);
    anchor = addr;
  }

  ///////////////// HELPERS /////////////////

  function assemble(uint256[8] chunks) internal pure returns (uint256 code) {
    for (uint256 i = chunks.length; i > 0; i--) {
      code ^= chunks[i - 1] << (8 * getSize(code));
    }
  }

  function getSize(uint256 chunk) internal pure returns (uint256) {
    bytes memory b = new bytes(32);
    assembly {
      mstore(add(b, 32), chunk)
    }
    for (uint32 i = 0; i < b.length; i++) {
      if (b[i] != 0) {
        return 32 - i;
      }
    }
    return 0;
  }
}
