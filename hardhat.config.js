require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.0",
  defaultNetwork: "goerli",
  networks: {
    hardhat: {},
    goerli: {
      rpc: "https://goerli.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161",
      account: [
        "2bc5841476be49d1fa13004685f6523f4be258ac4960cd59858bbf6532217e02",
      ],
    },
  },
};
