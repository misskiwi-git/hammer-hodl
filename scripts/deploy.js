require("dotenv").config();
const hre = require("hardhat");

async function main() {
  const HammerHodl = await hre.ethers.getContractFactory("HammerHodl");
  const hammerHodl = await HammerHodl.deploy(process.env.WITHDRAWAL_START_TIME)

  await hammerHodl.deployed();

  console.log(`Hammer Hodl contact has been deployed: ${hammerHodl.address}`);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  })