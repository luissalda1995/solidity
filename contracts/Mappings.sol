// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Mappings {

    mapping(address => uint) public usersBalance;

    function deposit(uint256 amount) public {
        usersBalance[msg.sender] += amount;
    }

    function checkBalance() public view returns (uint256) {
        return usersBalance[msg.sender];
    }
}