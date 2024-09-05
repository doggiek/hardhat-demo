// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IntegerExample {

    // 127
    int8 public _int8 = -(2 ** 8 / 2);

    // -128
    int8 public __int8 = 2 ** 8 / 2 - 1;

    // 无符号最大值：255（通常在solidity中不会使用到负数，所以用的最多的是无符号整数）
    uint8 public _uint8 = 2 ** 8 - 1;

    // 30个字节的无符号整数(2的256次方-1) 
    // 最大值：115792089237316195423570985008687907853269984665640564039457584007913129639935
    uint256 public _uint256 = 2 ** 256 - 1;
    // 115792089237316195423570985008687907853269984665640564039457584007913129639935
    uint public _uint = 2 ** 256 - 1;   // uint是uint256的别名

}