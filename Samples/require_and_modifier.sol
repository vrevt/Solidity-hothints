// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Main {
    // require 
    // revert
    // asset
    address owner;
    constructor() {
        owner = msg.sender;
    }

    event Paid(address indexed _from, uint _amount, uint _timestamp);

    receive() external payable {
        pay();
    }

    function pay() public payable {
        emit Paid(msg.sender, msg.value, block.timestamp);
    }

    modifier onlyOwner(address _to) {
        require(msg.sender == owner, "you are not owner!");
        require(msg.sender == address(0), "incorrect address");
        _;
    }

    function withdraw(address payable _to) external onlyOwner(_to) {
        _to.transfer(address(this).balance);
    }
}
