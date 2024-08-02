// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ILogic {
    function getNumber() external view returns (uint);
    function setNumber(uint _number) external;
}

// 缺陷：需要定义接口，如果方法很多就很麻烦
contract Proxy {
    ILogic public logic;

    function setLogicAddress(address _logicAddress) public {
        logic = ILogic(_logicAddress);
    }

    function getLogicAddress() public view returns (address) {
        return address(logic);
    }

    function getNumber() public view returns (uint) {
        return logic.getNumber();
    }

    function setNumber(uint _number) public {
        logic.setNumber(_number);
    }

}