pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {

  event Log (string func);
  fallback() external payable { 
    emit Log("fallback");
  }

  receive() external payable { 
    emit Log("recieve");
  }

  
}
