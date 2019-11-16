pragma solidity ^0.4.24;

contract GuardLibrary {
    bool public complete;
}

contract StrongBox {
    address public GuardLib;
    
    constructor (address _guardLibrary) public {
        GuardLib = _guardLibrary;
    }
    
    function pass () public view returns (bool) {
        return GuardLibrary(GuardLib).complete();
    }
}

