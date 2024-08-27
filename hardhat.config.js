require('@nomicfoundation/hardhat-toolbox');
// require('@nomiclabs/hardhat-waffle');

const { ethers } = require('hardhat');
const { task, extendEnvironment } = require('hardhat/config');

// 申请alchemy的api key
const ALCHEMY_API_KEY = 'KEY';

//将此私钥替换为测试账号私钥
//从Metamask导出您的私钥，打开Metamask和进入“帐户详细信息”>导出私钥
//注意:永远不要把真正的以太放入测试帐户
const GOERLI_PRIVATE_KEY = 'YOUR GOERLI PRIVATE KEY';

// 申请etherscan的api key
const ETHERSCAN_API_KEY = 'YOUR_ETHERSCAN_API_KEY';

task('accounts', 'Prints the list of accounts', async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();
  for (const account of accounts) {
    console.log(account.address);
  }
});

extendEnvironment((hre) => {
  const Web3 = require('web3');
  hre.Web3 = Web3;
  hre.web3 = new Web3(hre.network.provider);
});

module.exports = {
  solidity: '0.8.24',
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
      accounts: [GOERLI_PRIVATE_KEY],
    },
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
};
