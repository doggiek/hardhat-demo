// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken43 is ERC20 {

    constructor() ERC20("MyToken43", "MYT") {
        _mint(msg.sender, 100000000 * 10 ** decimals());
    }

    // 18位默认，如果是USDT重写，4位就够了
    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    // solidity 中没有小数，小数在金融领域不精确，只用整数表示
    // 5,6 => 0, 不满足需求
    function divider(uint numerator, uint denominator) public pure returns (uint) {
        return numerator * 10000 / denominator;
    }

    // 保留多少位，前端再除一下来展示
    // 5,6,10 => 8333333333 => UI: 0.8333333333
    // 2,3,10 => 6666666666 => 期望是: 0.6666666667 不满足
    function divider2(uint numerator, uint denominator, uint precision) public pure returns (uint) {
        return numerator * (uint(10) ** uint(precision)) / denominator;
    }

    // 2,3,10 => 6666666667 => UI: 0.6666666667
    function divider3(uint numerator, uint denominator, uint precision) public pure returns (uint) {
        return (numerator * (uint(10) ** uint(precision + 1)) / denominator + 5) / uint(10);
    }
}