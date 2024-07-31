require("@nomicfoundation/hardhat-toolbox");

// 申请alchemy的api key
const ALCHEMY_API_KEY = "KEY";

//将此私钥替换为测试账号私钥
//从Metamask导出您的私钥，打开Metamask和进入“帐户详细信息”>导出私钥
//注意:永远不要把真正的以太放入测试帐户
const GOERLI_PRIVATE_KEY = "YOUR GOERLI PRIVATE KEY";

// 申请etherscan的api key
const ETHERSCAN_API_KEY = "YOUR_ETHERSCAN_API_KEY";

module.exports = {
  solidity: "0.8.24", // solidity的编译版本
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
      accounts: [GOERLI_PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: ETHERSCAN_API_KEY,
  },
};