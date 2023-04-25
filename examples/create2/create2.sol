```solidity
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
//this example uses a slightly ammended version of Foundry's Counter.sol default contract to test with
import "./Counter.sol";

contract Creat2example {

    Counter public counter;
    address payable public _counteraddress ;
    bytes32 public SALTT = bytes32(keccak256("saltvalue"));
    function createFirst() external
    {
        
        bytes32  SALTL = SALTT;
        
        bytes memory bytecode = type(Counter).creationCode;
        address counterAddress;
       
        assembly {
            counterAddress := create2(0, add(bytecode, 0x20), mload(bytecode), SALTL)
            if iszero(extcodesize(counterAddress)) {
            revert(0, 0)
        }
        }
        counter = Counter(payable(counterAddress));
        _counteraddress = payable(counterAddress);
        counter.setNumber(40_000);
        
    }

    function createSecond() external 
    {
        
       bytes32  SALTL = SALTT;
       
        bytes memory bytecode = type(Counter).creationCode;
        address counterAddress;
        
        assembly {
            counterAddress := create2(0, add(bytecode, 0x20), mload(bytecode), SALTL)
            if iszero(extcodesize(counterAddress)) {
            revert(0, 0)
        }
        }
        counter = Counter(payable(counterAddress));
        _counteraddress = payable(counterAddress);
        counter.setNumber(10_000);        
    }

    receive() payable external{}
}

```
