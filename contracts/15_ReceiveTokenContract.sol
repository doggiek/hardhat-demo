// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ReceiveTokenContract {
    IERC20 myToken;
    address owner;

    // 这里是上面DoggieKToken代币的地址，部署的时候需要这个地址
    constructor(address _tokenAddress) {
        myToken = IERC20(_tokenAddress); 
        owner = msg.sender;
    }

    // 从钱包转代币到智能合约
    // 调transferFrom失败 ERC20InsufficientAllowance，需要代币授权给这个合约 approve方法
    function transferFrom(uint256 amount) public {
        myToken.transferFrom(msg.sender, address(this), amount);
    }

    function getBalance(address _address) public view returns (uint256) {
        return myToken.balanceOf(_address);
    }

    function kill() public {
        myToken.transfer(owner, myToken.balanceOf(address(this)));
        // Deprecated, 弃用了 
        // starting from the Cancun hard fork, 
        // the underlying opcode no longer deletes the code and data associated with an account and only transfers its Ether to the beneficiary
        selfdestruct(payable (owner));
    }
}