// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    uint private num;

    function setNum(uint _num) public {
        num = _num + 1;
    }

    function getNum() public view returns (uint) {
        return num;
    }

    function setBNum(address _bAddress, uint _num) public {
        B b = B(_bAddress);
        b.setNum(_num);
    }

    function setBNumCall(address _bAddress, uint _num) public {
        // num存储在B的智能合约里
        (bool result, ) = _bAddress.call(
            abi.encodeWithSignature("setNum(uint256)", _num)
        );
        if (!result) revert();
    }

    function setBNumDelegateCall(address _bAddress, uint _num) public {
        // num存储在A的智能合约里，常用于区块链的升级
        (bool result, ) = _bAddress.delegatecall(
            abi.encodeWithSignature("setNum(uint256)", _num)
        );
        if (!result) revert();
    }
}

contract B {
    uint private num;

    function setNum(uint _num) public {
        num = _num + 2;
    }

    function getNum() public view returns (uint) {
        return num;
    }
}