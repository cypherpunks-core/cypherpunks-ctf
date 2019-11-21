pragma solidity ^0.4.18;

contract PaperScissorsStone {
  uint8 public winTimes;
  uint8[3] public rps;
  uint8 randomIndex;

  function PaperScissorsStone() public {
    winTimes = 0;
    rps[0] = 0;
    rps[1] = 1;
    rps[2] = 2;
  }

  function guess(uint8 _guess) public {
    require(_guess >= 0 && _guess < 3);

    randomIndex = uint8(block.blockhash(block.number - 42)) % 3;

    if (rps[randomIndex] + 1 == _guess) {
      winTimes++;
    } else if (rps[randomIndex] == 2 && _guess == 0) {
      winTimes++;
    } else {
      winTimes = 0;
    }
  }

  function win() public returns (bool) {
    return winTimes == 3 ? true : false;
  }
}
