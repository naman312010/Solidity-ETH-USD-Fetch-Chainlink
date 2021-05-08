pragma solidity ^0.6.7;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/DeFiEx.sol";

contract TestDeFiEx {
  function TestInitialStateOfContract() public {
    DeFiEx defiex = new DeFiEx();

    Assert.isZero(defiex.noOfStoredRates(),  "Initial stored conversion rates should be 0");
  }

  function TestRateCreationAndStorage() public {
    DeFiEx defiex = new DeFiEx();
    defiex.createRate();
    
    Assert.isNotZero(defiex.noOfStoredRates(), "New rates entries are created");
  }

  function TestRateAvg() public {
    DeFiEx defiex = new DeFiEx();
    defiex.createRate();
    Assert.isNotZero(defiex.avgRate(), "Average rate is calculated created");
  }

  function TestDeletion() public {
    DeFiEx defiex = new DeFiEx();
    defiex.createRate();
    uint num = defiex.noOfStoredRates();
    defiex.deleteRateByIndex(num-1);
    Assert.isZero(defiex.noOfStoredRates(), "Deletion of rate entries successful by index");
  }

  function TestRateReading() public {
    DeFiEx defiex = new DeFiEx();
    defiex.createRate();
    uint num = defiex.noOfStoredRates();
    Assert.isNotZero(defiex.readRateByIndex(num-1), "Reading of rates successful by index");
  }

  function TestUpdation() public {
    DeFiEx defiex = new DeFiEx;
    defiex.createRate();
    uint num = defiex.noOfStoredRates();
    defiex.updateRate(num-1);
    Assert.equal(num,defiex.noOfStoredRates(),"Updation of rates successful by index");
  }

}