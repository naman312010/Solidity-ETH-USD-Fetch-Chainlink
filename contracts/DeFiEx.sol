pragma solidity ^0.6.7;

import "./AggregatorV3Interface.sol";
// import "https://github.com/smartcontractkit/chainlink/blob/master/evm-contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract DeFiEx {

    struct convPrice{
        uint serial;
        int rate;
        uint8 decimalPlaces;
    }
    
    uint storedRates = 0;
    convPrice[] excgRates;
    AggregatorV3Interface internal priceFeed;

    /**
     * Network: Rinkeby
     * Aggregator: ETH/USD
     * Address: 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e
     */
    constructor() public {
        priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
    }

    function noOfStoredRates() public view returns(uint){
        return storedRates;
    }
    
    function createRate() public {                          //Creates new entry in convPrice[] public excgRates at the back
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        // If the round is not complete yet, timestamp is 0
        require(timeStamp > 0, "Round not complete");
        convPrice memory a;
        a.serial = storedRates;
        a.rate = price;
        a.decimalPlaces = priceFeed.decimals();
        excgRates.push(a);
        storedRates+=1;
    }
    
    function deleteRateByIndex(uint x) public {                //Removes an enrty of exchange rate in excgRates array
        //x refers to the index of excgRate to be removed from array
        require(x<=storedRates-1 && x>=0,"Serial for removal must be between zero and storedRates-1");
        while(x<storedRates-1) {
            excgRates[x] = excgRates[x+1];
            x++;
        }
        excgRates.pop();
        storedRates--;
    }
    
    function readRateByIndex(uint x) public view returns (int) {        //Displays ceiling value of exchange rate
        int a;
        a = excgRates[x].rate / (int(10) ** excgRates[x].decimalPlaces);
        return a;
    }
    
    function readRawDataByIndex(uint x) public view returns(int val,uint8 decimal_places) {         //shows conversion rate and decimal places for it
        return(excgRates[x].rate,excgRates[x].decimalPlaces);
    }
    
    function updateRate(uint x) public {                //Updates rate value of given index
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        // If the round is not complete yet, timestamp is 0
        require(timeStamp > 0, "Round not complete");
        convPrice memory a;
        a.serial = x;
        a.rate = price;
        a.decimalPlaces = priceFeed.decimals();
        excgRates[x] = a;
    }
    
    function avgRate() public view returns (int) {                   //Finds average conversion rate, ceiling value
        int avg = 0;
        uint i = 0;
        while(i<storedRates) {
            avg+=excgRates[i].rate;
            i+=1;
        }
        avg = avg / int(storedRates);
        return (avg/(int(10)**excgRates[storedRates-1].decimalPlaces));       //all convPrice entries share same decimal places
    }
    
    function rawAvgRate() public view returns (int average,uint8 decimal_places) {                   //Shows avg conversion rate and decimal places for it
        int avg = 0;
        uint i = 0;
        while(i<storedRates) {
            avg += excgRates[i].rate;
            i+=1;
        }
        avg = avg / int(storedRates);
        return (avg , excgRates[storedRates-1].decimalPlaces);      //all convPrice entries share same decimal places
    }
}