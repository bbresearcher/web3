//SPDX-License-Identifier: UNLICENSED

// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity=0.8.17;

interface IFactory{
    //function allTradingPairs() external view returns (address[] tradinpairs);
    event TradingPairCreatedEvent(address indexed tokenA,address indexed tokenB);
    
    function tradingPair(
        address tokenA,
        address tokenB
    ) external view returns (address pairContractAddress);

    function createTradingPair(
        address tokenA,
        address tokenB
    ) external returns (address pairContractAddress);
}