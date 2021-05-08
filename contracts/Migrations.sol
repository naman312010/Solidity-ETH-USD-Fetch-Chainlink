// SPDX-License-Identifier: MIT
pragma solidity ^0.6.7;

contract Migrations {
  address public owner = msg.sender;
  uint public last_completed_migration;

  modifier restricted() {
    require(
      msg.sender == owner,
      "This function is restricted to the contract's owner"
    );
    _;
  }

  function setCompleted(uint completed) public {
    last_completed_migration = completed;
  }
}
