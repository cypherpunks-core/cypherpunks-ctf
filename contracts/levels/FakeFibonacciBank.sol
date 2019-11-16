pragma solidity ^0.4.24;

contract FakeFibonacciLib {
    uint public start;
    uint public calculatedFibNumber;

    function setStart (uint _start) public {
        start = _start;
    }

    function setFibonacci (uint n) public {
        calculatedFibNumber = fibonacci(n);
    }

    function fibonacci (uint n) internal returns (uint) {
        if (n == 0) return start;
        else if (n == 1) return start + 1;
        else if (n == 2) return start + 2;
        else return fibonacci(n - 1) + fibonacci(n - 3);
    }
}

contract FakeFibonacciBank {
    address public fakeFibonacciLibrary;
    uint public calculatedFibNumber;
    uint public start = 3;
    uint public withdrawalCounter;
    bytes4 constant fibSig = bytes4(sha3("setFibonacci(uint256)"));

    constructor (address _fakeFibonacciLibrary) public payable {
        fakeFibonacciLibrary = _fakeFibonacciLibrary;
    }

    function withdraw() {
        withdrawalCounter += 1;
        // calculate the fibonacci number for the current withdrawal user
        require(fakeFibonacciLibrary.delegatecall(fibSig, withdrawalCounter));
        msg.sender.transfer(calculatedFibNumber * 0.001 ether);
    }

    function () public {
        require(fakeFibonacciLibrary.delegatecall(msg.data));
    }
}
