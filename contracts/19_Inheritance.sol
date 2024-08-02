// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A {
    // virtual
    function getName() public pure virtual returns (string memory) {
        return "A";
    }
}

contract B is A {
    // override
    function getName() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    function getNameA() public pure returns (string memory) {
       return super.getName();
    } 
    // public pure virtual override
    function getName() public pure virtual override returns (string memory) {
        return "C";
    }
}

// 多态
contract BC is B,C {
    function getNameBC() public pure returns (string memory) {
        return "BC";
    }
    // override(B, C)，实际是按顺序执行的，返回是C
    function getName() public pure override(B, C) returns (string memory) {
       return super.getName();
    } 
}
