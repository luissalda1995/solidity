// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

error AmountToSmall();

contract Modifiers {
    struct User {
        string name;
        uint256 age;
        uint256 balance;
    }

    uint private Feed = 10;
    address public owner;

    mapping(address => User) public usersData;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    // @notice we validate that the user has balance
    modifier hasDeposit() {
        User memory user = usersData[msg.sender];
        require(user.balance > 0, "You have to deposit");
        _;
    }

    // @dev the function modifier receives the amount as parameter to validate
    modifier mayorThanFee(uint256 _amount){
        if(_amount <= Feed){
            revert AmountToSmall();
        }
        _;
    }

    constructor(){
        owner = msg.sender;
    }

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

    // @notice Set balance of the user as 0
    function withdraw() public onlyOwner {
        User storage user = usersData[msg.sender];
        user.balance = 0;
    }

    // @notice We validate that the user has deposited before and the amount is mayor that the Fee
    function addFund(uint256 _amount) public hasDeposit mayorThanFee(_amount) {
        User storage user = usersData[msg.sender];
        user.balance += _amount;
    } 
}