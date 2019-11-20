pragma solidity ^0.4.24;

contract Freeshop {
  uint256 public withdrawalLimit = 0.1 ether;
  mapping(address => uint256) public lastWithdrawTime;
  mapping(address => uint256) public balances;

  function depositFunds() public payable {
    balances[msg.sender] += msg.value;
  }

  function withdrawFunds(uint256 _weiToWithdraw) public {
    // limit the withdrawal
    require(balances[msg.sender] >= _weiToWithdraw);
    // limit the time allowed to withdraw
    require(_weiToWithdraw <= withdrawalLimit);
    require(now >= lastWithdrawTime[msg.sender] + 1 weeks);

    msg.sender.call.value(_weiToWithdraw)();
    balances[msg.sender] -= _weiToWithdraw;
    lastWithdrawTime[msg.sender] = now;
  }

  function getBalance() public view returns (uint256) {
    return address(this).balance;
  }

  function() public payable {}
}
