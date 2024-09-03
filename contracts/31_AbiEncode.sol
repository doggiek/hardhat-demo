// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract A {

    // 调用方法的数据
    function getBFunctionBytes4() public pure returns(bytes4) {
        return bytes4(keccak256("bFunction(uint256,string)"));
    }

    // 要传入的参数
    function getParamBytes(uint256 _num, string memory _message) public pure returns (bytes memory) {
        return abi.encode(_num, _message);
    } 

    function callBFuncion(address _bAddress, bytes calldata _data) public returns (bool) {
        (bool success, )= _bAddress.call(_data);
        return success;
    }

}

contract B {
    uint256 public num;
    string public message;

    function bFunction(uint256 _num, string memory _message) public returns(uint256, string memory) {
        num = _num;
        message = _message;
        return (num, message);
    }

}