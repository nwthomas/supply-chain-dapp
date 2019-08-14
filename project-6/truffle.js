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
    ropsten: {
      provider: () =>
        new HDWalletProvider(
          process.env.MNENOMIC,
          "https://ropsten.infura.io/" + process.env.INFURA_API_KEY
        ),
      network_id: 3,
      gas: 5500000,
      confirmations: 2,
      timeoutBlocks: 200,
      skipDryRun: true
    },
    kovan: {
      provider: () =>
        new HDWalletProvider(
          process.env.MNENOMIC,
          "https://kovan.infura.io/v3/" + process.env.INFURA_API_KEY
        ),
      network_id: 42,
      gas: 3000000,
      gasPrice: 10000000000
    },
    rinkeby: {
      provider: () =>
        new HDWalletProvider(
          process.env.MNENOMIC,
          "https://rinkeby.infura.io/v3/" + process.env.INFURA_API_KEY
        ),
      network_id: 4,
      gas: 3000000,
      gasPrice: 10000000000
    },
    main: {
      provider: () =>
        new HDWalletProvider(
          process.env.MNENOMIC,
          "https://mainnet.infura.io/v3/" + process.env.INFURA_API_KEY
        ),
      network_id: 1,
      gas: 3000000,
      gasPrice: 10000000000
    }
  },
  compilers: {
    solc: {
      version: "0.4.24"
    }
  }
};
