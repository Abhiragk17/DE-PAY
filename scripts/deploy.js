
async function main() {

  const Salary = await ethers.getContractFactory("Salary");
  const salary = await Salary.deploy();

  await salary.deployed();

  console.log(`Contract deployed at ${salary.address}`);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
