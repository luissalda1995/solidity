// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Payable {

    mapping(address => uint) public usersBalance;

    function deposit() public payable {
        usersBalance[msg.sender] += msg.value;
    }

    function checkBalance() public view returns (uint256) {
        return usersBalance[msg.sender];
    }
}