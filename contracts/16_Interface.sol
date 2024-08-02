// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IEmployee {
    function setName(string memory _name) external ;
    function getName() external view returns(string memory);
}

contract Employee is IEmployee{
    string private name;

    function setName(string memory _name) public override {
       name = _name;
    }

    function getName() public override view returns (string memory) {
        return name;
    }
}

// 只需要IEmployee这个接口，就可以调用Employee的这个智能合约
contract Company {
    IEmployee employee;

    constructor(address _address) {
        employee = IEmployee(_address);
    }

    function getName() public view returns(string memory) {
        return employee.getName();
    }

    function setName(string memory _name) public {
        return employee.setName(_name);
    }
}