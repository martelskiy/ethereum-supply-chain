import { ethers } from "hardhat";

const ERC20TokenContractName = "ERC20Token";

async function main() {
  const tokenFactory = await ethers.getContractFactory(ERC20TokenContractName);
  const token = await tokenFactory.deploy(10000, "Foo Token", 18, "FooTkn");

  await token.deployed();
  console.log(
    `Contract with name ${ERC20TokenContractName} was deployed to address: ${token.address}`
  );
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
