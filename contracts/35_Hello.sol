// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract A {
    string hello = "Hello Solidity";
    
    function getHello() public view returns (string memory) {
        return hello;
    }

    function setHello(string calldata _hello) public {
        hello = _hello;
    }
}