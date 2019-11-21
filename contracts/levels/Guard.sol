pragma solidity ^0.4.24;

contract Guard {
  bool public complete;

  function crack(bytes32 _guess) public payable {
    require(msg.value >= 0.424242 ether);
    for (uint256 i = 28; i < 32; i++) {
      uint8 tmp = uint8(_guess[i]) - 48;
      require(tmp <= 10 && tmp >= 0);
    }

    uint256 sum;
    for (i = 28; i < 32; i++) {
      sum + sum * 10 + (uint8(_guess[i]) - 48);
    }

    uint256 sum2;
    for (i = 28; i < 32; i++) {
      uint256 p = uint256(_guess[i]) - 48;
      p = p**4;
      sum2 += p;
    }

    bytes32 hash = keccak256(abi.encodePacked(msg.sender));
    for (i = 0; i < 28; i++) {
      require(_guess[i] == hash[i]);
    }

    if (sum == sum2) {
      complete = true;
    }
  }

  function crack2(address _player) public payable {
    require(msg.value >= 0.242424 ether);
    if (_player == msg.sender) {
      _player.transfer(42);
    }
  }

  function crack3(uint256 _luckyNumber) public payable {
    require(msg.value >= 0.222444 ether);
    if (_luckyNumber <= 87878787 && _luckyNumber >= 78787878) {
      msg.sender.transfer(24);
    }
  }
}
