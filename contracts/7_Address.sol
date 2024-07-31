// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract AddressExample {
    address ownerAddress;

    constructor() {
        ownerAddress = msg.sender;
    }

    function getContractAddress() external view returns(address) {
        return address(this);
    } 

    function getSenderAddress() external view returns (address) {
        return address(msg.sender);
    }

    function getOwnerAddress() external  view returns (address) {
        return ownerAddress;
    }

    function getBalance() external view returns (uint, uint, uint) {
        uint contractBalance = address(this).balance;
        uint senderBalance = msg.sender.balance;
        uint ownerBalance = ownerAddress.balance;
        return (contractBalance, senderBalance, ownerBalance);
    }
}