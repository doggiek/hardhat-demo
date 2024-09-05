// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract EnumExample {

    // 一组具有共同属性的常量，可以用枚举来表示，比如：订单的状态
    enum Status {
        OPEN,    // 0 实际的value
        PENDING,   // 1
        PROCESS,   // 2
        FINISHED   //3
    }

    Status public status;   // 默认就是0
    Status public status_1 = Status.PENDING;  // 赋值初始化

    function setStatus(Status _status) public {  // 前端输入值的时候就是 0、1、2、3
        status = _status;
    }

    function setStatus2(uint8 _status) public {   // 也可以直接用整型传参，强转
        status = Status(_status);
    }

    function getStatus() public view returns(Status) {  // 如果定义的状态变量不是public的，就需要写个方法获取
        return status;
    }

    function getStatus2() public view returns(uint8) {
        return uint8(status);
    }

    // 删除状态变量
    function reset() public {
        delete status;  // 删除之后，status会恢复成默认的0
    }

    // 根据value获取枚举值文本（还是Java好！）
    function getEnumTextByValue(Status _status) public pure returns (string memory) {
        if (_status == Status.OPEN) {
            return "OPEN";
        } else if (_status == Status.PENDING) {
            return "PENDING";
        } else if (_status == Status.PROCESS) {
            return "PROCESS";
        } else if (_status == Status.FINISHED) {
            return "FINISHED";
        } else {
            revert();
        }
    }

    // 根据Text获取Value
    function getValueByText(string calldata _text) public pure returns (Status) {
        bytes32 bytesText = keccak256(bytes(_text));
        if (bytesText == keccak256(bytes("OPEN"))) {
            return Status.OPEN;
        } else if (bytesText == keccak256(bytes("PENDING"))) {
            return Status.PENDING;
        } else if (bytesText == keccak256(bytes("PROCESS"))) {
            return Status.PROCESS;
        } else if (bytesText == keccak256(bytes("FINISHED"))) {
            return Status.FINISHED;
        } else {
            revert();
        }
    }

}