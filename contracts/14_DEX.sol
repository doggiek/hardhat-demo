
// SPDX-License-Identifier: MIT
// DEX: Decentralized Exchange 的缩写，去中心化交易所
pragma solidity ^0.8.0;

// 用于在执行算术运算时防止溢出和下溢,会抛异常。Solidity 0.8.0 版本起，编译器内置了对算术运算的溢出检查
library SafeMath {
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");
        // assert(c >= a);
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a, "SafeMath: subtraction overflow");
        // assert(b <= a);
        return a - b;
    }
}

interface IERC20 {
    // 获取地址
    function getAddress() external view returns (address);
    // 发行多少代币
    function totalSupply() external view returns (uint256);
    // 根据地址获取余额
    function balanceOf(address account) external view returns (uint256);

    // 给代理人或者是代币交易所允许他们划走多少钱
    function approve(address owner, address spender, uint256 amount) external returns (bool);
    // 获取代理可以从账户中划取多少钱。用于管理代币所有者授权其他账户可以支配的代币数量。
    // 允许一个账户（代币所有者）授权另一个账户（被授权者）在其名下支配一定数量的代币，这个过程通常用于去中心化交易所（DEX）和其他需要自动化代币转移的场景。
    function allowance(address owner, address spender) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed sender, address indexed recipient, uint256 value);   
}

contract ERC20Basic is IERC20 {

    string public constant name = "ERC20-DoggieKChain";
    string public constant symbol = "ERC-DKC";
    uint8 public constant decimals = 18;

    mapping (address => uint256) balances;
    mapping (address => mapping (address => uint256)) allowedBalances;

    uint256 totalSupply_ = 1000000000000000000 wei;  // 1 ether = 10^18 wei
    // 语法糖，用于将SafeMath库中的函数附加到uint256类型上，用其定义的安全算法。
    using SafeMath for uint256;

    constructor() {
        // 分发给创建人
        balances[msg.sender] = totalSupply_;
    }


    function getAddress() external override view returns (address) {
        return address(this);
    }

    function totalSupply() external override view returns (uint256) {
        return totalSupply_;
    }

    function balanceOf(address account) external override view returns (uint256) {
        return balances[account];
    }

    function transfer(address receiver, uint256 numTokens) external override returns (bool) {
        require(numTokens <= balances[msg.sender]);
        balances[msg.sender] = balances[msg.sender].sub(numTokens);
        balances[receiver] = balances[receiver].add(numTokens);
        emit Transfer(msg.sender, receiver, numTokens);
        return true;
    }

    function approve(address owner, address delegate, uint256 amount) external override returns (bool) {
        allowedBalances[owner][delegate] = amount;
        emit Approval(owner, delegate, amount);
        return true;
    }

    function allowance(address owner, address delegate) external override view returns (uint256) {
        return allowedBalances[owner][delegate];
    }
        
    function transferFrom(address owner, address buyer, uint256 numTokens) external override returns (bool) {
        require(numTokens <= balances[owner]);
        require(numTokens <= allowedBalances[owner][msg.sender]);

        balances[owner] = balances[owner].sub(numTokens);
        allowedBalances[owner][buyer] = allowedBalances[owner][buyer].sub(numTokens);
        balances[buyer] = balances[buyer].add(numTokens);
        emit Transfer(owner, buyer, numTokens);
        return true;
    }
}

contract DEX {

    event Bought(uint256 amount);
    event Sold(uint256 amount);

    IERC20 public token;

    constructor() {
        token = new ERC20Basic();
    }

    function buy() public payable {
        uint256 ammountToBuy = msg.value;
        uint256 dexBalance = token.balanceOf(address(this));  // 合约有多少钱
        require(ammountToBuy > 0, "You need to send some Ether");
        require(ammountToBuy <= dexBalance, "Not enough tokens in the reserve");
        token.transfer(msg.sender, ammountToBuy);
        emit Bought(ammountToBuy);
    }

    function sell(uint256 ammount) public payable {
        require(ammount > 0, "You need to sell some tokens");
        // 需要中心化的合约DEX去处理，所以需要授权
        uint256 allowance = token.allowance(msg.sender, address(this));
        require(allowance >= ammount, "Check the token allowance");
        token.transferFrom(msg.sender, address(this), ammount);
        emit Sold(ammount);
    }

    function getDEXBalance() public view returns(uint256) {
        return token.balanceOf(address(this));
    }

}

