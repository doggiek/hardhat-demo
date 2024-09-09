// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract TestCase {
    // 有payable这个owner地址就可以transfer或者send了
    address payable public owner;

    // payable部署合约的时候可以传入以太坊的代币给合约
    constructor(address _owner) payable {
        owner = payable(_owner);
    }

    // 提现
    function withdraw() public {
        if (msg.sender != owner) {
            revert();
        }
        owner.transfer(address(this).balance);
    }
}
