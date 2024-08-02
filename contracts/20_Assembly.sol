// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Assem {
    function add(uint a, uint b) public pure returns (uint) {
        assembly {
            let sum := add(a, b)  // 把a压入栈，b也压入栈，使用add操作码对a、b操作，返回的结果放sum变量里
            mstore (0x0, sum)   // memorystore，存储到内存地址中，0x0是地址（也称为零地址或空地址）
            return (0x0, 32)  // 返回的值就是指针的地址，32位因为是整型
        }
    }

    function call(uint a) public pure returns (uint) {
        bytes4 sig = bytes4(keccak256("call(uint)"));  // 函数选择器（function selector）是函数签名的前4个字节的哈希值，用于识别合约中的特定函数
        assembly {
            mstore(0x0, sig)  // 放内存地址中
            let addressData := add(0x0, 4)  // 因为是4位，如果我们想把a放进来就要加4位
            mstore(addressData, a)
            return (addressData, 32)
        }
    }
}