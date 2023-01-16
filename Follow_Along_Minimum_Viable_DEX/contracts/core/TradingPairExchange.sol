//SPDX-License-Identifier: UNLICENSED

// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity=0.8.17;
import "./interfaces/ITradingPairExchange.sol";

contract TradingPairExchange is ITradingPairExchange{
    address public factoryContract;
    address public tokenA;
    address public tokenB;

    constructor(){
        factoryContract = msg.sender;
    }

    function initialize(address _tokenA,address _tokenB) external {
        require(msg.sender == factoryContract, 'DEX: INIT NOT BY FACTORY');
    }
}