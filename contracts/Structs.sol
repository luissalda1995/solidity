// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Structs {
    struct User {
        string name;
        uint256 age;
        uint256 balance;
    }

    mapping(address => User) public usersData;

    function deposit(uint256 amount) public {
        User storage user = usersData[msg.sender];
        user.balance = amount;
    }

    function checkBalance() public view returns (uint256) {
        return usersData[msg.sender].balance;
    }

    function setUserDetails(string calldata name, uint256 age) public {
        usersData[msg.sender] = User(name, age, 0);
    }

    function getUserDetail() public view returns (User memory){
        return usersData[msg.sender];
    }
}