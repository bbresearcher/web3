//SPDX-License-Identifier: UNLICENSED

// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity=0.8.17;
import "./interfaces/IRouter.sol";
import "../core/interfaces/IFactory.sol";
import "./libraries/DEXLibrary.sol";
contract Router is IRouter{
    address public immutable factoryAddress;

    constructor(address _factoryAddress){
        factoryAddress = _factoryAddress;
    }
    function _addLiquidity(
        address tokenA,
        address tokenB,
        uint amountDesiredA,
        uint amountDesiredB
    ) internal returns (uint amountA,uint amountB){
        address pairContractAddress = IFactory(factoryAddress).tradingPair(tokenA,tokenB);
        if(pairContractAddress == address(0)){
            pairContractAddress = IFactory(factoryAddress).createTradingPair(tokenA,tokenB);
        }
        (uint reserve0, uint reserve1) = DEXLibrary.getReserves(factoryAddress,tokenA,tokenB);

        if(reserve0==0 && reserve1==0){
            (amountA,amountB) = (amountDesiredA,amountDesiredB);
        }
    }

    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountDesiredA,
        uint amountDesiredB
    ) external returns (uint amountA,uint amountB){
        (amountA,amountB) = _addLiquidity(tokenA,tokenB,amountDesiredA,amountDesiredB);
    }
}