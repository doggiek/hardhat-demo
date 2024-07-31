// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

error UnAuthorized(string error, address _address);

contract ErrorExample {
    address payable owner = payable(msg.sender);

    function withdraw() public {
        if (msg.sender != owner) {
            revert UnAuthorized({error: "UnAuthorized", _address: msg.sender});
        }
        owner.transfer(address(this).balance);
    }
}