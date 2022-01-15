require("@nomiclabs/hardhat-waffle");
require('dotenv')
module.exports = {
  solidity: "0.8.0",
  networks: {
    rinkeby: {
      url: process.env.ALCHEMY_API.toString(),
      accounts: [process.env.RINKEBY_KEY],
    },
  },
};
