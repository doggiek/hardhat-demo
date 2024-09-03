// 我们可以通过 npx hardhat run <script> 来运行想要的脚本
// 这里你可以使用 npx hardhat run deploy.js 来运行
const hre = require('hardhat');

async function main() {
  const Contract = await hre.ethers.getContractFactory('ERC20');
  const token = await Contract.deploy('WTF', 'WTF');
  await token.waitForDeployment();
  console.log('成功部署合约:', token.target);

  const MyToken = await hre.ethers.getContractFactory('MyToken32');
  const myToken = await MyToken.deploy('1000');
  await myToken.waitForDeployment();
  console.log('myToken32 deployed to: ', myToken.address);
}

// 运行脚本
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
