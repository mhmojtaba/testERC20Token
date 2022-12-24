const hre = require("hardhat");

async function main() {
  const Token = await hre.ethers.getContractFactory("Chita");
  const token = await Token.deploy();

  await token.deployed();

  console.log(`token deployed to ${token.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => (processprocess.exitCode = 0))
  .catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
