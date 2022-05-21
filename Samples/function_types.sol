// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Main {
    // public - и клиент извне и изнутри контракта
    // external - можно обращаться только извне
    // internal - только изнутри
    // private - только изнутри контракта но не из потомков

    // view - вызов функции происходит через call, только чтение данных
    // pure - аналогично view, но не может читать внешние данные 

    // call
    function getBalance() public view returns(uint balance) {
        balance = address(this).balance;
    }

    uint public balance;
    function pay() external payable {
        balance += msg.value;
    }

    // если деньги пришли, имя функции передано, но такого имени нет в контракте
    fallback() external {

    }

    // если деньги просто переведены на адрес контракта 
    receive() external payable {
        // balance += msg.value;
    }
    
    string message = "hi!";

    // error
    function getMessage() external view returns(string memory){
        return message;
    }

    // transaction
    function setMessage(string memory newMessage) external {
        message = newMessage;
    }
}
