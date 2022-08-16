pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract {

  event FundsDeposited(address user, uint256 amount);
  event ProfileUpdated(address user);

  struct Person { 
    string name;
    uint256 age;
  }

  mapping(address => Person) public personal_info;
  mapping(address => uint) public balances;

  constructor() {
  }

  function setUserDetails(string calldata _name, uint256 _age) public {
    personal_info[msg.sender] = Person(_name,_age);
    emit ProfileUpdated(msg.sender);
  }

  function deposit(uint256 _amount) public {
    balances[msg.sender] += _amount;
    emit FundsDeposited(msg.sender, _amount);
  }

  function checkBalance(address _user) public view returns(uint256) {
    return(balances[_user]);
  }

  function getUserDetail(address _user) public view returns(string memory, uint256) {
    return(personal_info[_user].name, personal_info[_user].age);
  }
}
