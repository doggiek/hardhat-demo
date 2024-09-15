const { expect } = require('chai');
const { ethers } = require('hardhat');

// Ethers.js JsonRpcProvider https://docs.ethers.org/v5/api/providers/jsonrpc-provider/
describe('Ethers', function () {
  it('For localhost JsonRpcProvider', async function () {
    // 也可以直接hardhat加载出来 hre.ethers.XXX
    // const provider = new ethers.providers.JsonRpcProvider();
    const provider = new ethers.JsonRpcProvider();
    // 获取connect
    const connection = provider.connection;
    console.log('connection:', connection);

    // 可以随便找一个账户地址
    const signer = await provider.getSigner('0x8626f6940E2eb28930eFb4CeF49B2d1F2C9C1199');
    // for signer address
    const signerAddress = await signer.getAddress();
    console.log('signerAddress:', signerAddress);

    // 发起交易，矿工可能还没开始挖，这个就不需要等待直接能返回（可能是空的或者Mock的），要想获取真实数据需要过个2s再加载
    // ethers v6 JsonRpcProvider.getUncheckedSigner 被移除了
    // 在 Ethers.js v6 中，不受信任的签名者（Unchecked Signer）现在不再直接通过 getUncheckedSigner 来获取，而是改为在签名交易的时候指定 unchecked 选项。
    // const uncheckedSigner = await provider.getUncheckedSigner('0xdD2FD4581271e230360230F9337D5c0430Bf44C0');
    // const uncheckedSignerAddress = await signer.getAddress();
    // console.log('uncheckedSignerAddress:', uncheckedSignerAddress);

    // 进行不受信任的交易（签名但不发送）
    const tx = {
      to: '0xbDA5747bFD65F08deb54cb465eB87D40e51B197E',
      value: ethers.parseEther('0.01'),
    };
    // 使用 unchecked 选项
    const signedTx = await signer.sendTransaction(tx, { unchecked: true });
    console.log(signedTx);

    // for accountlist
    const accounts = await provider.listAccounts();
    console.log('accounts:', accounts);

    // for provider send method
    const arrayAccounts = ['0xdD2FD4581271e230360230F9337D5c0430Bf44C0'];
    const accountBalance = await provider.send('eth_getBalance', arrayAccounts); // 很万能，所有json-rpc里的的方法都能调
    console.log('accountBalance:', ethers.formatEther(accountBalance)); // v6
  });
});
