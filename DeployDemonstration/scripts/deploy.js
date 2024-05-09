const {ethers, run} = require("hardhat")

async function main () 
{
    const SimpleStorageFactory = await ethers.getContractFactory("SimpleStorage"); 
    console.log("deploying");
    const SimpleStorage = await SimpleStorageFactory.deploy();

    console.log(`Deployed contract to: ${SimpleStorage.target}`);
    if (network.config.chainId === 11155111 && process.env.ETHER_SCAN){
        await SimpleStorage.deploymentTransaction().wait(6)
        console.log("verifying in the function");
        await verify(SimpleStorage.target, [])
    }

}

const verify = async (contractAddress, args) => {
  console.log("Verifying contract...")
  try {
    await run("verify:verify", {
      address: contractAddress,
      constructorArguments: args,
    })
  } catch (e) {
    if (e.message.toLowerCase().includes("already verified")) {
      console.log("Already Verified!")
    } else {
      console.log(e)
    }
  }
}
main().then(()=>process.exit(0))
.catch((error) => {
    console.error(error);
    process.exit(1);
  });