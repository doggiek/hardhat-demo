// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Array {
    uint[] arr1;
    uint[] arr2 = [1,2,3];
    uint[3] arr3;

    // Data location must be "memory" or "calldata" for return parameter in function
    function getArray() public view returns (uint[] memory) {
        return arr2;
    }

    function getByIndex(uint _index) public view returns (uint) {
        return arr2[_index];
    }

    function getLength() public view returns (uint) {
        return arr3.length;
    }

    function put(uint _value) public {
        arr2.push(_value);
    }

    function pop() public {
        arr2.pop();
    }

    // 这个delete，删除后该index变成0 eg:[1,2,0,4,0]
    function deleteByIndex(uint _index) public {
        delete arr2[_index];
    }
}

