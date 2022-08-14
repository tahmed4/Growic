pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "hardhat/console.sol";
import "@openzeppelin/contracts/access/Ownable.sol"; 
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol

contract YourContract is Ownable {

  event Registered(address student, string name);

  struct studentData{
    string name;
    uint256 percentage;
    uint256 totalMarks;
  }

  mapping(address => studentData) public students;

  constructor() {
    // what should we do on deploy?
  }

  function register(address _newStudent, string memory _name, uint _marks) public onlyOwner {
      require(keccak256(bytes(students[_newStudent].name)) == keccak256(bytes("")));
      students[_newStudent] = studentData(_name, _marks * 100 / 100, _marks);
      emit Registered(_newStudent, _name);
  }

  function getStudentDetails (address student) public view returns(string memory, uint256,uint256) {
    require(keccak256(bytes(students[student].name)) != keccak256(bytes("")));
    return(students[student].name, students[student].percentage, students[student].totalMarks);
  }
}
