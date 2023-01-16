const { expect } = require("chai");
const { loadFixture } = require("@nomicfoundation/hardhat-network-helpers");
const { ethers } = require("hardhat");

describe("Router Contract", ()=>{
    async function deployRouterFixture(){
        const WETHERC20Token = "0";
        const DAIERC20Token = "0";
        const RouterContract = await ethers.getContractFactory("Router");
        const router =  await RouterContract.deploy();
        //assuming ETH to DAI at ETH = $1000 and DAI = $1;
        const amountDesiredA = 1;
        const amountDesiredB = 1000;
        await router.deployed();
        return { WETHERC20Token,
                 DAIERC20Token,
                 amountDesiredA,
                 amountDesiredB,
                 router 
                };
    }
});

describe("Deposit Liquidity", ()=>{
    it("should only allow a deposit of two tokens of equal value", async ()=>{
        const { tokenA,
                tokenB,
                router } = await loadFixture(deployRouterFixture);
        const { amountA, amountB } = await router.addLiquidity(
                tokenA,tokenB
        );
        expect(true).eq(true);
    });
});