// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherWallet {
    address public owner;

    // 合约构造函数，设置合约的所有者
    constructor() {
        owner = payable(msg.sender);
    }

    // 修饰符，用于限制某些功能只能由合约的所有者调用
    modifier onlyOwner() {
        require(owner == msg.sender, "Not owner");
         _;
    }

    // 提现，有三种方式
    function withdraw1(uint _amount) external onlyOwner {
        bool sent = payable(msg.sender).send(_amount);
        require(sent, "Send failed");
    } 
    
    function withdraw2(uint _amount) external {
        payable(msg.sender).transfer(_amount);
    } 

    function withdraw3(uint _amount) external {
        (bool sent, ) = payable(msg.sender).call{ value: _amount}("");
        require(sent, "Send failed");
    } 

    // 接收以太币的函数，允许合约接收 ETH
    receive() external payable { }

     // 查看合约中的余额
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}