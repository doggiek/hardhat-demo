// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract ViewPureExample {
    uint public age;

    function increaseAge() public {
        // 要修改数据，要minner打包数据+验证，就需要气
        age ++;
    }

    function getAgeByView() public view returns(uint) {
        // view不能修改
        return age;
    }

    function getAgeByPure(uint _age) public pure returns(uint) {
        // pure不能访问链上的数据，这个_age是你自己传入的局部参数不是age
        _age++;
        return _age;
    }
}
