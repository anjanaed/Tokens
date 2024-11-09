require("@nomicfoundation/hardhat-toolbox");
require("dotenv").config();
const {PRIVATE_KEY} = process.env;

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.27",
  defaultNetwork: "sepolia",
  networks: {
    hardhat: {
    },
    sepolia: {
      url: "https://sepolia.drpc.org",
      accounts: [PRIVATE_KEY]
    }
  }
};

