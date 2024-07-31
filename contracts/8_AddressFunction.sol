// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract AddressFunction {

    function send(address payable _to) public payable {
        bool result = _to.send(msg.value);
        require(result, "Send failed");
    }  

    function transfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function call(address payable _to) public payable {
        (bool result, ) = _to.call{value: msg.value, gas: 5000}("");
        require(result, "Call failed");
    }
}

