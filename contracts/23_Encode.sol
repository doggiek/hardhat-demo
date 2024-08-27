// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    function callBfunc1(address _address, uint256 _num, string memory _message) public returns (bool) {
        (bool success, ) = _address.call(
            abi.encodeWithSignature("funcB(uint256,string)", _num, _message)
        );
        return success;
    }

    function callBfunc2(address _address, uint256 _num, string memory _message) public returns (bool) {
        bytes4 sig = bytes4(keccak256("funcB(uint256,string)"));  // 通过keccak256编码后取前四位
        bytes memory _bNum = abi.encode(_num);
        // abi.encode 常用于合约间的调用、数据存储、事件记录等场景，特别是当你需要将不同类型的数据打包在一起传递时
        bytes memory _bMessage = abi.encode(_message);
        (bool success, ) = _address.call(
            abi.encodePacked(sig, _bNum, _bMessage)
        );
        return success;
    }

    function callBfunc3(address _address, uint256 _num, string memory _message) public returns (bool) {
        bytes4 sig = bytes4(keccak256("funcB(uint256,string)")); 
        (bool success, ) = _address.call(
            abi.encodeWithSelector(sig, _num, _message)
        );
        return success;
    }

    function callBfunc4(address _address, uint256 _num, string memory _message) public returns (bool) {
       B contractB = B(_address);  // 创建一个B的智能合约，最简单且最常用
       (uint256 n, string memory m) = contractB.funcB(_num, _message);
       return true;
    }
}


contract B {
    uint256 public num;
    string public message;

    function funcB(uint256 _num, string memory _message) public returns (uint256, string memory) {
        num = _num;
        message = _message;
        return (num, message);
    }
}