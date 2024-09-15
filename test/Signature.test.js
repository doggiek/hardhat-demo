const { expect } = require('chai');
const { ethers } = require('ethers');

describe('Signature', function () {
  // TODO: need to fix testcase
  it('Verify', async function () {
    const [owner] = await ethers.getSigners(); // TypeError: ethers.getSigners is not a function --> const { ethers } = require("hardhat");

    // 部署
    const SignatureFactory = await ethers.getContractFactory('Signature');
    const signature = await SignatureFactory.deploy();
    // await signature.deployed();
    await signature.waitForDeployment();
    console.log('contract address: ' + signature.address);

    const message = 'DoggieChain';
    // const messageHash = ethers.utils.solidityPackedKeccak256(['string'], [message]);
    const messageHash = ethers.solidityPackedKeccak256(['string'], [message]); // https://docs.ethers.org/v6/api/hashing/#solidityPackedKeccak256
    // const messageHashByte = ethers.utils.arrayify(messageHash);
    const messageHashByte = ethers.getBytes(messageHash); // v5->v6 arrayify -> getBytes  https://github.com/ethers-io/ethers.js/issues/3795
    const sig = await owner.signMessage(messageHashByte);
    // const sigVRS = ethers.utils.splitSignature(sig);
    const sigVRS = ethers.Signature.from(sig); // https://docs.ethers.org/v6/migrating/#migrate-signatures

    expect(await signature.verify(owner.address, message, sigVRS.v, sigVRS.r, sigVRS.s)).to.equal(true);
  });
});
