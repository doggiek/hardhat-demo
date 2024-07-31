// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * 自己发代币
 */
contract DoggieKChain is ERC20 {
    constructor() ERC20("DoggieKChain", "DKC") {
        _mint(msg.sender, 100000000 * 10 ** decimals());
    }
}
