```solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;
    address public owner;
    constructor(){
        owner = msg.sender;
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
    
    //function to be called for selfdestruct
    function bye() external
    {
        selfdestruct(payable(address(0)));
    }
    
    //a function to view the balance of ETH in the contract
    function getBalance() external view returns(uint256){
        return address(this).balance;
    }
    
    //receive so that ETH can be sent to the contract.
    receive() payable external{}
}

```
