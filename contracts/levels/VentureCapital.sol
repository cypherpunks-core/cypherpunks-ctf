pragma solidity ^0.4.24;

contract DeveloperAuthorizer {
  bool public developerMode;

  constructor() public payable {
    if (address(this).balance >= 0.424242 ether) {
      developerMode = true;
    }
  }

  function turnOff() public payable {
    require(msg.sender == tx.origin, "Sorry, humans only.");
    if (msg.value > 0 && address(this).balance == 1 ether) {
      developerMode = false;
    }
  }

  function kill() public {
    require(developerMode == false);
    selfdestruct(msg.sender);
  }
}

contract VentureCapital {
  struct Client {
    address manager;
    uint256 age;
    address clientAddress;
    uint256 amount;
  }

  address public manager;
  address public owner;
  uint256 public startTime;
  uint256 public clientBalance;
  mapping(address => bool) fundManagementEnabled;
  mapping(address => uint256) clientIndex;
  Client[] clients;
  DeveloperAuthorizer public developerAuthorizer;

  constructor() public payable {
    // developerAuthorizer = (new developerAuthorizer).value(0.424242 ether)();
    developerAuthorizer = new DeveloperAuthorizer();
    owner = address(0x593Bc8EF18E35a3E3022412727c13768cB36da71);
    manager = msg.sender;
  }

  modifier isManager() {
    require(
      fundManagementEnabled[msg.sender] ||
        msg.sender == manager ||
        developerAuthorizer.developerMode()
    );
    _;
  }

  function managementEnable(address _newManager) public isManager {
    fundManagementEnabled[_newManager] = true;
  }

  function newClient(address _clientAddress, uint256 _age)
    public
    payable
    isManager
  {
    uint256 index = clientIndex[_clientAddress];
    if (index != 0) {
      Client storage client = clients[index - 1];
      client.amount += msg.value;
      clientBalance += msg.value;
    } else {
      clientBalance += msg.value;
      client.manager = manager;
      client.age = _age;
      client.clientAddress = _clientAddress;
      client.amount = msg.value;
      clients.push(client);
      clientIndex[_clientAddress] = clients.length;
    }
  }

  function byeClient() public isManager {
    uint256 all = clients.length;
    for (uint256 i = all; i >= 1; i--) {
      clients[i - 1].clientAddress.transfer(clients[i - 1].amount + 1);
      clients.length -= 1;
    }
  }

  function clientWithdraw(address _clientAddress) public isManager {
    uint256 index = clientIndex[_clientAddress];
    require(index != 0);
    Client storage client = clients[index - 1];
    if (client.amount > 0) {
      client.clientAddress.call.value(1)();
      clientBalance -= 1;
      client.amount -= 1;
    }
  }

  function close() public isManager {
    require(developerAuthorizer.developerMode() == false);
    require(msg.sender == owner);
    require(clients.length == 0);
    msg.sender.transfer(address(this).balance);
  }

  function() external payable {}
}
