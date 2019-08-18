require("dotenv").config();
const HDWalletProvider = require("truffle-hdwallet-provider");

module.exports = {
  networks: {
    ganache: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*" // Matches any network ID
    },
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*"
    },
    rinkeby: {
      provider: () =>
        new HDWalletProvider(
          process.env.MNENOMIC,
          "https://rinkeby.infura.io/v3/" + process.env.INFURA_API_KEY
        ),
      network_id: 4,
      gas: 4500000,
      gasPrice: 10000000000
    }
  },
  compilers: {
    solc: {
      version: "0.4.24"
    }
  }
};
