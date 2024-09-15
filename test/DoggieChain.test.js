const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('ERC20 合约测试', () => {
  it('合约部署', async () => {
    // ethers.getSigners,代表eth账号  ethers 是一个全局函数，可以直接调用
    const [owner, addr1, addr2] = await ethers.getSigners();
    // ethers.js 中的 ContractFactory 是用于部署新智能合约的抽象，因此这里的 ERC20 是我们代币合约实例的工厂。ERC20代表contracts 文件夹中的 ERC20.sol 文件
    // const Token = await ethers.getContractFactory('ERC20');
    // 部署合约, 传入参数 ERC20.sol 中的构造函数参数分别是 name, symbol 这里我们都叫做WTF
    // const hardhatToken = await Token.deploy('WTF', 'WTF');

    const Token = await ethers.getContractFactory('DoggieChain1');
    const hardhatToken = await Token.deploy();
    await hardhatToken.waitForDeployment();
    // 获取合约地址
    const ContractAddress = await hardhatToken.target;
    expect(ContractAddress).to.properAddress;
  });

  // 前置条件安装web3.js库，npm install --save-dev web3
  // 测试，ethers和web3装一个就可以，一般都会选择ethers
  const { Web3 } = require('web3'); // For web3(v4.x)
  // 连接到本地的以太坊节点（例如，Ganache 或 Geth）
  const web3 = new Web3('http://localhost:8545');
  // const web3 = new Web3(process.env.INFURA_URL);

  it('for web3', async () => {
    const accounts = await web3.eth.getAccounts();
    console.log(accounts);
  });
});
