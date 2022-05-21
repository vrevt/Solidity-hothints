//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

// import "hardhat/console.sol";

contract Payments {
    struct Payment{
        uint amount;
        uint timestamp;
        address from;
        string message;
    }
    struct Balance{
        uint totalPayment;
        mapping(uint => Payment) payments;
    }

    mapping(address => Balance) public balances;

    function currentBalance() public view returns(uint){
        return address(this).balance; 
    }

    function pay(string memory message) public payable {
         uint n = balances[msg.sender].totalPayment++;
         Payment memory newPayment = Payment(
             msg.value,
             block.timestamp,
            msg.sender,
            message
         );
         balances[msg.sender].payments[n] = newPayment;
    }

    function getPayment(address _addr, uint _ind) public view 
returns(Payment memory){
        return balances[_addr].payments[_ind];
    }
}

