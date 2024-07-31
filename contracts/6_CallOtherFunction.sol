// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Salary {
    uint public data;

    function getData() external view returns (uint) {
        return data;
    }

    function setData(uint _data) external {
        data = _data;
    }
}

contract Empolyee {
    Salary salary;

    constructor() {
        salary = new Salary();
    }

    function getSalary() external view returns (uint) {
        return salary.getData();
    }

    function setSalary(uint _salary) external {
        salary.setData(_salary);
    }

    function getSalaryAddress() external view returns (address) {
        return address(salary);
    }
}