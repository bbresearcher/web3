//SPDX-License-Identifier: UNLICENSED

// Solidity files have to start with this pragma.
// It will be used by the Solidity compiler to validate its version.
pragma solidity=0.8.17;

interface IRouter{
    
    function addLiquidity(
        address tokenA,
        address tokenB,
        uint amountDesiredA,
        uint amountDesiredB
    ) external returns (uint amountA,uint amountB);
}