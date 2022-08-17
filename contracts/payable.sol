pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {

  event RegisterBalance(address user, uint256 amount);

  mapping(address => uint) public balances;

  constructor() {
  }

  function deposit() public payable {
      balances[msg.sender] += msg.value;
      emit RegisterBalance(msg.sender, msg.value);
  }

  function checkBalance() public view returns(uint256) {
    return(balances[msg.sender]);
  }
}
