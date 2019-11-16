pragma solidity ^0.4.18;

contract University {
    
    address public owner;
    bool public combined = false;
    uint public time = now;
    string public university_name = "National Chiao Tung University";
    bytes32[6] private name;

    function University (bytes32[6] _name) public {
        owner = tx.origin;
        name = _name;
    }
    
    function combine (string _name) {
        require (owner == msg.sender);
        
        if (stringToBytes32(_name) == name[2]) {
            combined = true;
        }
        else {
            combined = false;
        }
    }
    
    function stringToBytes32 (string memory _name) returns (bytes32 name) {
        bytes memory tmp = bytes(_name);

        if (tmp.length == 0) {
            return 0x0;
        }
    
        assembly {
            name := mload(add(_name, 32))
        }
    }
}