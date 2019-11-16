pragma solidity ^0.4.18;

contract Dragon {
    bool public dragonTail;
    bool public dragonWings;
    bool public dragonHead;
    address public dragonDen;
    address public owner;
    
    constructor (address _owner, address _dragonDen) {
        dragonTail = false;
        dragonWings = false;
        dragonHead = false;
        owner = _owner;
        dragonDen =_dragonDen;
    }
    
    function complete() public returns (bool) {
        return (dragonTail && dragonWings && dragonHead);
    }
    
    function attackHead () public {
        require(msg.sender == owner);
        
        dragonHead = true;
    }

    function attackWings (address _address) public {
        require(msg.sender == _address);

        bytes20 addr = bytes20(_address);
        bytes20 ft_blood = hex"00000000000000000000000000000000042b100d";
        bytes20 mask = hex"000000000000000000000000000000000fffffff";

        for (uint256 i = 0; i < 34; i++) {
            if (addr & mask == ft_blood) {
                dragonWings = true;
            }
            mask <<= 4;
            ft_blood <<= 4;
        }

    }
    
    function attackTail (bytes _secrect) public {
        require(address(keccak256(_secrect)) == dragonDen);
        
        dragonTail = true;
    }
    
    function changeDragonDen () public payable {
        require(msg.value == 0.42 ether);
        
        address tmp = owner;
        owner = dragonDen;
        dragonDen = tmp;
    }
    
}