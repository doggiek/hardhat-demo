// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MyToken32 {
    uint private number;

     constructor(uint _num) {
        number = _num;
    }

    function setNumber(uint _number) public {
        number = _number;
    }

    function getNumber() public view returns (uint) {
        return number;
    }
}