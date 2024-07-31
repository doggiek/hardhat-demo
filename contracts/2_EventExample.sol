// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// 3. 监听事件。
// 用Web3.js/Ethers.js库来监听事件，前端应用可以实时响应智能合约的状态变化，提供动态用户体验。
contract EventExample {
    // 1. 定义一个事件
    // Transfer事件有三个参数：from、to和value。indexed关键字表示这些参数是可索引的，可以在过滤日志时使用。
    event Transfer(address indexed from, address indexed to, uint256 value);

    // 2. 触发事件
    // 在合约中，使用emit关键字来触发事件。触发事件时，会生成一条日志记录，并在区块链上存储。
    // 当transfer函数被调用时，Transfer事件会被触发，记录发送者地址msg.sender、接收者地址to和转账金额value。
    function transfer(address to, uint256 value) public {
        // 触发事件
        emit Transfer(msg.sender, to, value);
    }
}
