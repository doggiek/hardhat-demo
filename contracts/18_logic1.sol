// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Logic1 {
    uint private number;

    function getNumber() public view returns (uint) {
        return number;
    }

    function setNumber(uint _number) public {
        number = _number + 1;
    }
}
