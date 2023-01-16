//SPDX-License-Identifier: UNLICENSED

// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity=0.8.17;
import "./interfaces/IFactory.sol";
import "./TradingPairExchange.sol";
import "./interfaces/ITradingPairExchange.sol";
contract Factory is IFactory{

    mapping(address => mapping(address=>address)) public tradingPair;
    address[] public allTradingPairs;

    function createTradingPair(
        address tokenA,
        address tokenB
    ) external returns (address pairContractAddress){
        require(tokenA != tokenB, "DEX: IDENTICAL ADDRESS PAIR CREATION ATTEMPT");
        require(tokenA != address(0) && tokenB != address(0), "DEX: CREATE PAIR TOKEN ADDRESS IS ZERO");
        require(tradingPair[tokenA][tokenB] == address(0), "DEX: TRADING PAIR CONTRACT ALREADY EXISTS");

        bytes memory bytecode = type(TradingPairExchange).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(tokenA,tokenB));
        assembly{
            pairContractAddress := create2(0, add(bytecode,32),mload(bytecode),salt)
        }

        ITradingPairExchange(pairContractAddress).initialize(tokenA,tokenB);
        tradingPair[tokenA][tokenB] = pairContractAddress;
        tradingPair[tokenB][tokenA] = pairContractAddress;
        //allTradingPairs.push(pairContractAddress);
        emit TradingPairCreatedEvent(tokenA,tokenB);
    }
}