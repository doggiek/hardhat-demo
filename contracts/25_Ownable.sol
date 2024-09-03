// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.24;

import "@openzeppelin/contracts@5.0.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@5.0.2/access/Ownable.sol";

contract DoggieChain is ERC20, Ownable {
    constructor(address initialOwner)
        ERC20("DoggieChain", "DGC")
        Ownable(initialOwner)
    {
        _mint(msg.sender, 100000 * 10 ** decimals());
    }

    // 只能合约的拥有者才能挖矿，否则：transact to DoggieChain.mint errored: Error occurred: revert.
    // 如果调用renounceOwnership之后，智能合约就没人管理了（所有带onlyOwner的方法都会revert），但它可以继续工作，
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
