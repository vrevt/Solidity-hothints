// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Main {
    mapping (address => uint) public payments;

    function receiveFunds() public payable{
        payments[msg.sender] = msg.value;
    }

    function transferTo(address payable targetAddr, uint amount) public {
        targetAddr.transfer(amount);
    }
    
    function getBalance(address targetAddr) public view returns(uint) {
        return targetAddr.balance;
    }
}
