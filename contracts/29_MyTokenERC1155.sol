// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken1155 is ERC1155, Ownable {

    uint256 public constant TOKEN_A = 0;
    uint256 public constant TOKEN_B = 1;
    uint256 public constant TOKEN_C = 2;


    constructor(address initialOwner)
        ERC1155("https://doggie.k.chain/{id}.json")
        Ownable(initialOwner)
    {
        _mint(msg.sender, TOKEN_A, 100 ** 18, "");
        _mint(msg.sender, TOKEN_B, 10, "");
        _mint(msg.sender, TOKEN_C, 10000, "");
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }
}
