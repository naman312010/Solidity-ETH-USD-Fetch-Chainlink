/**
 * Use this file to configure your truffle project. It's seeded with some
 * common settings for different networks and features like migrations,
 * compilation and testing. Uncomment the ones you need or modify
 * them to suit your project as necessary.
 *
 * More information about configuration can be found at:
 *
 * trufflesuite.com/docs/advanced/configuration
 *
 * To deploy via Infura you'll need a wallet provider (like @truffle/hdwallet-provider)
 * to sign your transactions before they're sent to a remote public node. Infura accounts
 * are available for free at: infura.io/register.
 *
 * You'll also need a mnemonic - the twelve word phrase the wallet uses to generate
 * public/private key pairs. If you're publishing your code to GitHub make sure you load this
 * phrase from a file you've .gitignored so it doesn't accidentally become public.
 *
 */

// const HDWalletProvider = require('@truffle/hdwallet-provider');
// const infuraKey = "fj4jll3k.....";
//
// const fs = require('fs');
const HDWalletProvider = require("@truffle/hdwallet-provider");
const mnemonic = "YOUR ACCOUNT MNEMONIC";

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 9545,
      network_id: "*"
     },
    rinkeby: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "YOUR RINKEBY PROJECT ID")
      },
      network_id: 4
    }
  },
  compilers: {
    solc: {
      version: "0.6.7", // A version or constraint - Ex. "^0.5.0"
                         // Can also be set to "native" to use a native solc
      //docker: <boolean>, // Use a version obtained through docker
      //parser: "solcjs",  // Leverages solc-js purely for speedy parsing
      //settings: {
        //optimizer: {
          //enabled: <boolean>,
          //runs: <number>   // Optimize for how many times you intend to run the code
        //},
        //evmVersion: <string> // Default: "istanbul"
      //},
      //modelCheckerSettings: {
        // contains options for SMTChecker
      //}
    }
  }
};
