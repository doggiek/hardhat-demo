// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./13_import1.sol";
// Hardhat doesn't support imports via https.
// import "https://github.com/doggiek/hardhat-demo/blob/main/contracts/13_import1.sol";   

contract ImportExample2 {
    ImportExample1 importExample = new ImportExample1();

    function getName() public view returns (string memory) {
        return importExample.getName();
    }

    function getAge() public view returns (uint) {
        return importExample.age();
    }
}