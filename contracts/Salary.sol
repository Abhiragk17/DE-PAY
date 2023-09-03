// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

contract Salary {

    address owner;
    mapping (address=>bool) public isEmployee;
    mapping (address => Employee) employees; 
    address[] public allEmployees;

    address[] interns;
    address[] juniors;
    address[] seniors;

    enum Position {Intern, Junior, Senior}

    struct Employee {
        address empAddress;
        Position empPosition;
        uint salary;
    }

    constructor(){
        owner = msg.sender;
    }
    
    function addEmployee(address payable empAddress, Position _position) public {
        isEmployee[empAddress] = true;

        uint pay;

        if (_position == Position.Intern) {
            interns.push(empAddress);
            pay = 0.001 ether;
        } 
        else if (_position == Position.Junior) {
            juniors.push(empAddress);
            pay = 0.002 ether;
        } 
        else if (_position == Position.Senior) {
            seniors.push(empAddress);
            pay = 0.003 ether;
        }

        Employee memory newEmployee = Employee(empAddress,_position, pay);
        employees[empAddress] = newEmployee;
        allEmployees.push(empAddress);

    }

    function getAllEmployees() public view returns (address[] memory, address[] memory, address[] memory) {
        return (interns, juniors, seniors);
    }


    function payEmployees() public payable {
        for (uint i = 0; i < allEmployees.length; i++) {
            payable(allEmployees[i]).transfer(employees[allEmployees[i]].salary);
        }
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

//     function acceptPayment() public payable {

//     }

//     function deleteEmployee(address empAddress) public {
//     require(msg.sender == owner, "Only the owner can delete employees.");
//     require(isEmployee[empAddress], "Address is not an employee.");

//     Position empPosition = employees[empAddress].empPosition;

//     // Remove the employee from the appropriate employee list
//     if (empPosition == Position.Intern) {
//         _removeEmployee(interns, empAddress);
//     } 
//     else if (empPosition == Position.Junior) {
//         _removeEmployee(juniors, empAddress);
//     } 
//     else if (empPosition == Position.Senior) {
//         _removeEmployee(seniors, empAddress);
//     }

//     // Delete the employee record
//     delete employees[empAddress];
//     isEmployee[empAddress] = false;
//     for (uint i = 0; i < allEmployees.length; i++) {
//         if (allEmployees[i] == empAddress) {
//             delete allEmployees[i];
//             break;
//         }
//     }
// }

// function _removeEmployee(address[] storage employeeList, address empAddress) private {
//     for (uint i = 0; i < employeeList.length; i++) {
//         if (employeeList[i] == empAddress) {
//             // Swap with the last element and then pop
//             employeeList[i] = employeeList[employeeList.length - 1];
//             employeeList.pop();
//             break;
//         }
//     }
// }

}