// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Abc {

}

interface IERCA165 {
    function supportInterface(bytes4 interfaceId) external pure returns (bool); 
    // function abc() external ;
}

contract TypeExample {

    // Type 不像是个普通数据类型（Integer、String），它更像是个通用的工具方法
    // 目前 Type 只支持 Interger、Interface、Contract
    uint256 public max = type(uint256).max;  // 115792089237316195423570985008687907853269984665640564039457584007913129639935
    uint256 public min = type(uint256).min;  // 0
    uint256 public max8 = type(uint8).max;  // 255
    uint256 public min8 = type(uint8).min;  // 0

    string public name = type(Abc).name;  // 合约名称 Abc
    // 获取合约的编码，用来部署到链上
    bytes public code = type(Abc).creationCode;  // 0x6080604052348015600e575f80fd5b50603e80601a5f395ff3fe60806040525f80fdfea264697066735822122008187649d82d7a46bb5d10cbbd8f0b9fe2f7ded894daffbc6f4dd1ee6edc84db64736f6c63430008140033
    // runtimeCode只有当Abc合约中有构造函数，且构造函数中有内联汇编的情况下，才会使用到
    bytes public rCode = type(Abc).runtimeCode;  // 0x60806040525f80fdfea26469706673582212205a6e224104884712d9e5d051970d7fa5e1aab6e3b66a6db4f7fdb1e2be3cce5764736f6c63430008140033
    // interfaceId是用来识别合约是什么类型的合约
    bytes4 public interfaceId = type(IERCA165).interfaceId;  // 0xe7c0e2d5

    // 获取 IERC20 接口的唯一标识符
    function getIERCA165InterfaceId() public pure returns (bytes4) {
        return type(IERCA165).interfaceId;
    }
}
