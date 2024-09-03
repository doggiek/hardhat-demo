require('@nomicfoundation/hardhat-toolbox');
require('dotenv').config();

const { ProxyAgent, setGlobalDispatcher } = require('undici');
const proxyAgent = new ProxyAgent('http://127.0.0.1:26490'); // 装了代理
setGlobalDispatcher(proxyAgent);

module.exports = {
  solidity: '0.8.24',
  networks: {
    rinkeby: {
      url: process.env.RINKEBY_INFURA,
      accounts: [process.env.PRIVKEY],
    },
    sepolia: {
      url: process.env.SEPOLIA_INFURA,
      accounts: [process.env.PRIVKEY],
    },
    // goerli: {
    //   url: `https://eth-goerli.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
    //   accounts: [process.env.GOERLI_PRIVATE_KEY],
    // },
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
};
