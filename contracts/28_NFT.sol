// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// NFT项目的名称（不能叫代币了），NFT代币、存储NFT地址、可烧掉、系统管理员
contract MyNFTToken is ERC721, ERC721URIStorage, ERC721Burnable, Ownable {
    // NFT的序列号，之前用Counters.Counter
    uint256 private _nextTokenId;

    constructor(address initialOwner)
        ERC721("MyNFTToken", "MTK")
        Ownable(initialOwner)
    {}

    // 安全挖矿，只有管理员能挖矿（可以去掉），挖给谁 + NFT的地址
    function safeMint(address to, string memory uri) public onlyOwner {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
