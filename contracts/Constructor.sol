// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
// Creating a contract
contract A {
    // Declaring state variable
    address immutable owner;
    uint FEE;
    constructor(uint _fee) {
	    owner = msg.sender;
        FEE = _fee;
    }
}

contract B is A {
     constructor() A(20) {}
}