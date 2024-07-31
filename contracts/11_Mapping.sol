// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Mapping {
    // 差异：不能遍历所有key，要用数组自己实现
    mapping(address => uint) accountMap;

    function getAddress(address _address) public view returns (uint) {
        return accountMap[_address];
    }

    function set(address _address, uint _balance) public {
        accountMap[_address] = _balance;
    }

    function remove(address _address) public {
        delete accountMap[_address];
    }
}