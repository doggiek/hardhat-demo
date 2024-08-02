// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library SafeMath {
    // miss pure, 不能访问链上数据
    // it's internal, 只有在当前类文件才能调用，如果类文件独立改public
    function add(uint a, uint b) public pure returns (uint) {
        uint c = a + b;
        assert(c >= a);
        return c;
    }

    function sub(uint a, uint b) public pure returns (uint) {
        assert(b <= a);
        return a - b;
    }
}

contract Example {
    using SafeMath for uint;

    function doAdd(uint _a, uint _b) public pure returns (uint) {
        // 注：调用类包类似于python的调用方式，跟普通的合约调用方法不相同 sm.add(_a, _b)
        return _a.add(_b);
    }

    function doSub(uint _a, uint _b) public pure returns (uint) {
        return _a.sub(_b);
    }
}