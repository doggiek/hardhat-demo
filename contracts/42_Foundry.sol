// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// for foundry test, todo install https://book.getfoundry.sh/forge/writing-tests 
contract Counter {

    uint256 public number;

    function setNumber(uint256 _num) public {  // 被测试的方法一定是public的
        number = _num;
    }

    function increment() public {
        number++;
    }
}