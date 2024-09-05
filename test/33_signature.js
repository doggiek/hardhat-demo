const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('Signature', function () {
  it('Verify', async function () {
    const [owner] = await ethers.getSigners();

    // 部署
    const SignatureFactory = await ethers.getContractFactory('Signature');
    const signature = await SignatureFactory.deploy();
    await signature.deployed();
    console.log('contract address: ' + signature.address);

    const message = 'DoggieChain';
    const messageHash = ethers.utils.solidityKeccake256(['string'], [message]);
    const messageHashByte = ethers.utils.arrayify(messageHash);
    const sig = await owner.signMessage(messageHashByte);
    const sigVRS = ethers.utils.splitSignature(sig);

    expect(await signature.verify(owner.address, message, sigVRS.v, sigVRS.r, sigVRS.s)).to.equal(true);
  });
});
