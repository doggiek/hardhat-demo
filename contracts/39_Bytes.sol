// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BytesExample {

    // Bytes的本质是字节数组，分为固定长度数组和动态数组
    bytes1 public b1 = 0xff;
    bytes1 public b2 = 0x0f;
    bytes1 public b3 = 0xff;
    bool public isEqual1 = b1 == b2;
    bool public isEqual2 = b1 == b3;

    // 定义长度为2的字节
    bytes2 public b4 = 0xffff;
    uint256 public length4 = b4.length;  // 长度为2，4个f，两个字节

    bytes32 public b5 = 0x01234567890abcdefe7468656265737400000000000000000000000000000000;
    uint256 public length5 = b5.length;
    bytes1 public b6 = b5[0]; // 获取第一个字节 0x01
    bytes1 public b7 = b5[1]; // 第二个 0x23

    // 定义动态数组（不可以直接用0xff赋值）
    bytes public data1 = "hello";  // 会将hello转成十六进制存储在插槽里，0x68656c6c6f
    bytes public data2 = abi.encodePacked("hello"); // 也可以这么使用，会将字符串转换成字节码然后赋值给变量，0x68656c6c6f
    // 0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000568656c6c6f000000000000000000000000000000000000000000000000000000
    bytes public data3 = abi.encode("hello");  // 与上面结果不同，上面经过了压缩

    bytes1[] public data4;  // 动态长度的字节相当于这个，不建议用这种方式，直接用bytes动态数组即可
    function push() public {
        data4.push(0xff);  // 可以在数组后追加数据，加一个字节，0x68656c6c6fff
        data1.push(0xff); // 也可以在变量的基础上追加数据，0xff
    }
}