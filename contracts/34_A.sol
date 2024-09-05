// SPDX-License-Identifier: GLP-3.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

import "hardhat/console.sol";

contract A is IERC721Receiver {

    address public owner;
    constructor() {
        owner = payable(msg.sender);
    }

    function transfer(address token, address to, uint256 tokenId) public onlyOwner {
        IERC721(token).safeTransferFrom(address(this), to, tokenId);
    }

    // 当调用 MyNFTToken.safeTransferFrom 时，先会去调 A 合约的这个方法，返回的是 onERC721Received 接口是否已经被实现了
     function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external override returns (bytes4) {
    return bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Not owner");
         _;
    }
}
