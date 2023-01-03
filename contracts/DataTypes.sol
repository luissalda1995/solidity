// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title DataTypes
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
contract DataTypes {

    uint256 number = 8; // positive numbers
    int negativeNumber = -8; // negative numbers
    bool isOwner = false; // boolean values
    address myAddress; // contract or wallet addresses
    enum Types{ SMALL, MEDIUM, LARGE }; // enum
    bytes1 uu = 0 x 45; // bytes

    /**
     * @dev Store value in variable
     * @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }

    /**
     * @dev Return value 
     * @return value of 'number'
     */
    function retrieve() public view returns (uint256){
        return number;
    }
}