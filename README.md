# hardhat-demo

### verify 上传源代码需要安装包

1. 安装依赖
   `npm install --save dotenv` 和 `npm install --save-dev @nomiclabs/hardhat-etherscan`

2. 部署验证
   注意：文档看一下 [hardhat etherscan](https://hardhat.org/hardhat-runner/plugins/nomicfoundation-hardhat-verify#hardhat-etherscan)

- 清缓存 `npx hardhat clean`
- `npx hardhat compile`
- `npx hardhat run scripts/deploy.js --network rinkeby`
- `npx hardhat verify --network rinkeby 0x55CeFDC7f9626f244f6584DfAbd6868D1715bB17 "1000"` 参数要跟部署合约的脚本中的一致
