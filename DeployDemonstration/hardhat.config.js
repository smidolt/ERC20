require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-verify");
require('dotenv').config();
const PRIVATE_KEY  = process.env.PRIVATE_KEY;
const ETHER_SCAN = process.env.ETHER_SCAN;
const SEPOLIA_URL = process.env.SEPOLIA_URL;

module.exports = {
  solidity: "0.8.24",
  defaultNetwork: "sepolia",
  networks: {
    hardhat: {},
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${SEPOLIA_URL}`,
      accounts: [`0x${PRIVATE_KEY}`],
      chainId: 11155111,
    }
  },
   etherscan: {
    apiKey: ETHER_SCAN
  },
  sourcify: {

    enabled: true
  }
}