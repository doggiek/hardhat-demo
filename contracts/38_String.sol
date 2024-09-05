// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract StringExample {

    // 本质是字符串数组，长度不固定
    string str1 = "Hello";
    string str2 = 'World';  // 也可以用单引号，不要混用，建议用双引号

    string public str3 = string(abi.encodePacked(str1, str2));

    function compareString(string calldata _str1, string calldata _str2) public pure returns (bool) {
        // return keccak256(abi.encode(_str1)) == keccak256(abi.encode(_str2));  // 可以判断，但效率很低
        return keccak256(abi.encodePacked(_str1)) == keccak256(abi.encodePacked(_str2));  // 前后加空格也是true？
    }

    // 0x68656c6c6f
    function encodePacked(string calldata _str) public pure returns (bytes memory) {
        return abi.encodePacked(_str);
    }

    // hello的encode，包括了字符串的内容以及长度，所以效率低
    // 0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000000568656c6c6f000000000000000000000000000000000000000000000000000000
    function encode(string calldata _str) public pure returns (bytes memory) {
        return abi.encode(_str);
    }

}