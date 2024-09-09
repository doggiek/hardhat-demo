// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// import "hardhat/console.sol";

contract Greeter {
    string name;

    function getName() public view returns (string memory) {
        return name;
    }

    function setName(string calldata _name) public {
        name = _name;
    }
}
