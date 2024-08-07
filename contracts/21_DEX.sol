// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./SwappableToken.sol";

// 36
/**
* 去中心化交易所 (DEX) 是一种基于区块链的交易平台，允许用户在不通过中介机构的情况下直接交易加密资产。实现一个基本的DEX需要两个主要部分：
* 1. 代币合约：实现可以被交易的代币。
* 2. DEX 合约：实现代币的交换逻辑。
*/
// https://medium.com/@tanner.dev/ethernaut-x-foundry-level-22-dex-%E7%AD%94%E6%A1%88%E8%A7%A3%E8%AA%AA-6da716bd0c64


contract Dex {
    using SafeMath for uint;
    address public token1;
    address public token2;

    // 在部署智能合约的时候就要把这两个地址传进来（要交换的两个代币的地址）
    constructor(address _token1, address _token2) {
        token1 = _token1;
        token2 = _token2;
    }

    // 调交易之前，对于from的地址还是要approve大于等于amount的个数
    function swap(address from, address to, uint amount) public {
        require((from == token1 && to == token2) || (to == token1 && from == token2), "Invalid tokens");
        // 要卖出的token的数量一定要大于等于实际卖出去的token数量
        require(SwappableToken(from).balanceOf(msg.sender) >= amount, "Not enough to swap");
        uint swap_amount = get_swap_price(from, to, amount);

        // 代币传给智能合约
        SwappableToken(from).transferFrom(msg.sender, address(this), amount);
        // 中心化交易所转给智能合约一定要approve
        SwappableToken(to).approve(address(this), swap_amount);
        SwappableToken(to).transferFrom(address(this), msg.sender, swap_amount);
    }

    function add_liquidity(address token_address, uint amount) public {
        // 添加流动性,在添加流动性之前一定要approve 数量要做合理分配，因为会涉及到代币的定价
        SwappableToken(token_address).transferFrom(msg.sender, address(this), amount);
    }

    function get_swap_price(address from, address to, uint amount) public view returns (uint){
        // 要卖出去的代币 * 合约上要买回来的多少代币 / 智能合约上有多少要卖出的代币
        return ((amount * SwappableToken(to).balanceOf(address(this))) / SwappableToken(from).balanceOf(address(this)));
    }

    function approve(address token, uint amount) public {
        SwappableToken(token).approve(msg.sender, address(this), amount);
    }
}

