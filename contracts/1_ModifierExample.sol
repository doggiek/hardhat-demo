// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract ModifierExample {
    address public owner;
    uint256 public account;

    constructor() {
        // msg.sender是一个全局变量，表示当前调用合约函数的地址。它是一个非常重要的变量，用于识别交易的发起者。
        owner = msg.sender;
        account = 0;
    }

    /**
     * 验证调用者身份,以确保只有授权的地址才能执行特定操作。例如，在一个简单的所有者权限合约中，只有合约的所有者才能调用某些函数。
     */
    modifier CheckOwner() {
        // modifier校验，会抛异常
        // The transaction has been reverted to the initial state. Reason provided by the contract: "Only owner".
        require(msg.sender == owner, "Only owner");
        _;
    }

    modifier Valid100(uint256 _account) {
        require(_account > 100, "Valid 100");
        _;
    }

    function updateAccount(
        uint256 _account
    ) public CheckOwner Valid100(_account) {
        account = _account;
    }

    function bk(uint256 _account) public {
        // 只有智能合约的创建者才能修改，如果每个方法都需要限制就很麻烦
        if (msg.sender == owner) {
            account = _account;
        }
    }
}
