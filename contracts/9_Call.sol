// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Receiver {
    event Received(address caller, uint amount, string message);

    receive() external payable { 
        emit Received(msg.sender, msg.value, "Receive is called");
    }

    fallback() external payable { 
        emit Received(msg.sender, msg.value, "Fallback is called");
    }

    function foo(string memory _message, uint _y) public payable returns(uint) {
        emit Received(msg.sender, msg.value, _message);
        return _y;
    }

    function getAddress() public view returns (address) {
        return address(this);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

// 发起的智能合约
contract Caller {
    // 接收的智能合约
    Receiver receiver;

    constructor() {
        receiver = new Receiver();
    }

    event Response(bool success, bytes data);

    function testCall2(address payable _addr, uint _y) public payable {
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("foo(string,uint256)", "call foo", _y)  // 这里不能有空格
        ); 
        emit Response(success, data);  // 这里返回的是100的十六进制 "0x000...00064"
    }

    function testCall(address payable _addr) public payable {
        // 1. (bool success, bytes memory data) = _addr.call{value: msg.value}("");  // 调了receive
        // 2. (bool success, bytes memory data) = _addr.call{value: msg.value}("abc");    // 返回是false，没调receive
        (bool success, bytes memory data) = _addr.call{value: msg.value}("abc");  // 有参数调的是callback，可以接收代币，但返回的data是“0x”
        emit Response(success, data);
    }

    function getAddress() public view returns(address) {
        return receiver.getAddress();
    }

    function getBalance() public view returns(uint) {
        return receiver.getBalance();
    }
}

