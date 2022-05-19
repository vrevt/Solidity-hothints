// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Main {
    // Array
    uint[10] public items;

    function fillItems() public {
        items[0] = 1;
        items[9] = 8;
    }

    function getItem(uint index) public returns(uint) {
        return items[index];
    }

    // 2+D Array
    // uint[n][m] (измерения от конца к началу, поэтому m строк и n столбцов)

    // Dynamic Array
    uint[] public dArray;
    uint public len;
    function filldArray() public {
        dArray.push(1);
        dArray.push(3);
        dArray.push(1);
        len = dArray.length;
    }

    // array in memory 
    function sampleMemory() public view returns(uint[] memory){
        uint[] memory tempArray = new uint[](10);
        tempArray[1] = 1;
        tempArray[2] = 3;
        return tempArray;
    }   

    // Enum
    enum Status {
        Paid,
        Delivered,
        Received
    }
    Status public curStat;
    function setPaid() public {
        curStat = Status.Paid;
    }
    function setDelivered() public {
        curStat = Status.Delivered;
    }
}
