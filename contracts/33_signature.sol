// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Signature {
    function verifty(
        address _signer,
        string memory _message,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external pure returns (bool) {
        bytes32 messageHash = keccak256(abi.encodePacked(_message));
        bytes32 messageDigest = keccak256(
            abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash)
        );
        return ecrecover(messageDigest, v, r, s) == _signer;
    }
}
