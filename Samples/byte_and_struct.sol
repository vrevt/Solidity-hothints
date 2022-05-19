// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Main {
    // Byte
    bytes32 public myLet = "test here"; // строка test будет представлена в байтовом виде
    bytes public myBytes = "x y z"; 

    function demo() public view returns(uint){
        return myLet.length;
    }

    // struct
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

    function getPayment(address _addr, uint _ind) public view returns(Payment memory){
        return balances[_addr].payments[_ind];
    }
}
