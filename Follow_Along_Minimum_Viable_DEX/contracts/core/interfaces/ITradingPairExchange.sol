//SPDX-License-Identifier: UNLICENSED

// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity=0.8.17;

interface ITradingPairExchange{
    
    function initialize(address, address) external;
}
