// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "hardhat/console.sol";

contract ExampleModifier {
    uint256 public amount;
    address public owner;
    bool public passed100;

    constructor() {
        owner = msg.sender;
    }

    modifier requireOwner() {
        require(msg.sender == owner, "Only owner!");
        _;  // 这个是执行完require如果是对的就去执行updateAmount()方法，执行完如果checkOwner还有语句就继续往下走
        // ...
    }

    modifier checkOwner(uint256 _amount) {
        console.log("1");
        require(_amount == 100, "Amount should be 100");
        console.log("2");
        _;
        console.log("3");
        passed100 = true; 
        console.log("4");
    }

    function updateAmount(uint256 _amount) public requireOwner checkOwner(_amount) {
        // if (owner != msg.sender) {
        //     revert("Only owner!");
        // }
        console.log("5");
        amount = _amount;
        // revert("error");  // 模拟方法异常，看passed100
        console.log("6");
    }
}