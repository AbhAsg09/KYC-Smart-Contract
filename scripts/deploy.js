const main = async () => {
  const Contract = await hre.ethers.getContractFactory("Contract");
  const transactions = await Contract.deploy();

  await transactions.deployed();

  console.log("Contract deployed to:", transactions.address);
}

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
}

runMain();