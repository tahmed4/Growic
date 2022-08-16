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

  function deposit(uint256 _amount) public {
      balances[msg.sender] += _amount;
      emit RegisterBalance(msg.sender, _amount);
  }

  function checkBalance(address _user) public view returns(uint256) {
    return(balances[_user]);
  }
}
