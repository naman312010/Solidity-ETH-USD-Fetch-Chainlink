# Solidity-ETH-USD-Fetch-Chainlink
### Requirements:
- Remix IDE
- Funds in wallet, on Rinkeby network
- Truffle IDE (including @truffle/hdwallet-provider)

This is a dapp utilizing Chainlink to fetch ETH/USD prices from Rinkeby test network, and like all oracles, it requires a fee.
Because of this, the smart contract cannot be tested without connecting using the configuration file, which is configured to connect to 
Rinkeby network using Infura and a MetaMask wallet.
This dapp has been successfully been tested through Remix IDE via an Injected Web3 environment to Rinkeby network with the same MetaMask wallet mentioned before.
But due to some problems with the development environment I have installed, I was unable to migrate these contracts onto Rinkeby via Truffle and therefore
was unable to test using Truffle. The written tests can be found in the 'test' folder. The contract in question can be found in 'contracts' folder.

### Pros of Chainlink:
- Easy to integrate
- Cheaper oracle fee that Oraclize(now Provable-things)
- Completely decentralized

### Cons of Chainlink:
- The new conversion rate takes 15-20 minutes to be updated on Chainlink exchange addresses

In the field of finance, decimals have long been the cause of loss of large amounts of money to rounding off. With this in mind, Solidity did not keep decimal support.
Inspired from this, the option to use raw information, which denotes actual exchange value without decimal,and returns the decimal places along with it, has 
been kept in the dapp.

### Functions:
createRate()  //Creates new entry in convPrice[] public excgRates at the back
noOfStoredRates()   //Returns number of stored rates
deleteRateByIndex(uint x)      //Removes an entry of exchange rate in excgRates array
readRateByIndex(uint x)       //Displays ceiling value of exchange rate
readRawDataByIndex(uint x)         //shows conversion rate without decimal, and decimal places for it
updateRate(uint x)         //Updates rate value of given index
avgRate()        //Finds average conversion rate, ceiling value
rawAvgRate()           //Shows avg conversion rate without decimal, and decimal places for it
