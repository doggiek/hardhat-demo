// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ImportExample1 {
    uint public age = 20;
    string private name = "Katerina";

    function getName() public view returns (string memory) {
        return name;
    }
}