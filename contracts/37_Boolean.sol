// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BoolExample {
    // default是false，可以赋值为true
    bool public bool1 = true;
    bool public bool2 = !bool1;
    bool public bool3 = bool1 && bool2;
    bool public bool4 = bool1 || bool2;

    uint16 public a = 10;
    uint16 public b = 20;
    bool public bool5 = a == b; // 不知道为啥不用括号，应该是符号优先级OK
    bool public bool6 = a != b;
    bool public bool7 = a > b;
    bool public bool8 = a >= b;
    bool public bool9 = a < b;
    bool public bool10 = a <= b;

    function checkBool() public {
        if (bool1) {
            // logic
            bool1 = false;
        } else {
            // logic
            bool1 = true;
        }
    }

    // 0 * 2 ** 8 = 0 == 0x0000000000000000000000000000000000000000000000000000000000000000
    // 1 * 2 ** 8 = 256 == 0x0000000000000000000000000000000000000000000000000000000000000100
    function bool2Integer(bool _b) public pure returns (uint256) {
        uint256 _bInt;
        // 内联汇编
        assembly {
            _bInt := _b
        }
        return _bInt << 8;
    } 

    function int2Bytes32(uint256 _i) public pure returns (bytes32) {
        return bytes32(_i);
    }
}
