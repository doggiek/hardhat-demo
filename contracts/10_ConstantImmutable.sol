// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract ConstantImmutable {

    // 需要有default值，编译后不能再修改
    string constant name = "DoggieK";
    // 部署后不能再修改，必须在构造函数里初始化
    uint immutable age;

    constructor() {
        age = 20;
    }

    // 获取constant只能用pure修饰符
    function getName() public pure returns(string memory) {
        return name;
    }

    function getAge() public view returns(uint) {
        return age;
    }
}
