const hre = require('hardhat');

async function main() {
  // 获取合约工厂
  const Greeter = await hre.ethers.getContractFactory('Greeter');
  // 部署合约
  const greeter = await Greeter.deploy();
  // 等待合约部署完成
  // await greeter.deployed(); @deprecated
  await greeter.waitForDeployment();

  // greeter.address @deprecated
  console.log(`Greeter deployed to ${greeter.target}`);
}

main();

// main()
//   .then(() => process.exit(0))
//   .catch((error) => {
//     console.error(error);
//     process.exit(1);
//   });
