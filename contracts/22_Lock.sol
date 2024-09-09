// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DoggieChain1 is ERC20, Ownable {
    bool public isLocked = false;
    string public lock_account = "0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2";

    constructor() ERC20("DoggieChain", "DOG") Ownable(msg.sender) {
        // 10000 * 10 ** decimals() 表达式用于将代币数量标准化为最小单位。这对于定义代币的初始供应量、用户余额和交易金额非常重要，确保代币的所有操作都符合其精度标准。
        // - 10000：这是代币的基数。
        // - 10 ** decimals()：这是一个幂运算，表示 10 的 decimals 次方。例如，如果 decimals 为 18，那么 10 ** 18 结果为 1000000000000000000。
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function transfer(
        address _to,
        uint _amount
    ) public override returns (bool) {
        require(isLocked == false, "Transfer was locked");
        // 看起来字串需要abi.encode
        require(
            keccak256(abi.encodePacked(msg.sender)) ==
                keccak256(abi.encode(lock_account)),
            "Account was locked"
        );
        super.transfer(_to, _amount);
    }

    // onlyOwner修饰符:来限制函数只能由合约所有者调用。
    function setLock() public onlyOwner returns (bool) {
        isLocked = true;
        return true;
    }
}
