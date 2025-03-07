require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-ignition");
require("dotenv").config();

/**@type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.24",
  networks: {
    Sepolia: {
      url: process.env.INFURA_PROJECT_ID,
      accounts: ["0x" + process.env.PRIVATE_KEY],
    }
  }
};