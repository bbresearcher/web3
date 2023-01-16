## THIS IS A FOLLOW ALONG FROM THE SERIES ON [WEB3 BLOCKCHAIN DEVELOPER YOUTUBE CHANNEL](https://www.youtube.com/@DeFiDeveloperAcademy/videos)
## Decentralized Exchange
## AMM Automated Market Maker
Works on a formula called **"Constant Product formula"**<br>
```x * y = K```<br>
x is reserves for first token in pool and y is the reserve of the 2nd token = K **this is so after a trade too**<br>

## Liquidity Pools
The amount of Liquidity tokens are calculated using the geomteric mean.<br/>
Contains pools of paired tokens of equal value<br>
Follow 2 Rules<br>
1. Liquidity Providers must deposit two ERC20 tokens of equal value<br>
2. Liquidity Pools must be governed by the **"Constant Product formula"**

## Main Actors and Actions in a Decentralized Exchange
### 2 main Actors
1. Liqidity Providers
2. Traders

### 3 Main Actions
1. Exchange tokens
2. Add Liquidity (deposit)
3. Withdraw funds

## 8 Main Formulas (Will expand as we prgress because its difficult to write the just in characters)
1. Governing Liquidity Pool ```x*y=K```
2. Price of a token **Price token A = Reserves Token B / Reserves Token A**
3. Exchanging Assets and Tokens Formula **Delta Y = (r delta x)y OVER x+(r delta x)**
4. a
5. a
6. a
7. a
8. a

## 4 Main Contracts
1. ExchangeContract.sol
2. LiquidityTokenContract.sol
3. FactoryContract.sol
4. RouterContract.sol

## Two Main design patterns
1. Binary Contract System
2. Agnostic transfer Pattern
### DEX Business Model
Liquidty Provider "invests" Two Tokens of the same value, and when a trader trades they pay a **0.30** fee which goes to the Liquidity Provider.<br>
As a Provider locks their funds into the pool, they get a **Liquidity Token** is return.<br>
**Liquidity Token** is partial ownership or shares in a pool.<br>
When a provider want s to "cash out" they burn they liquidity tokens and then get back their initial investment along with their share of the rewards within the pool.<br>
### Can DEX developers make money?
Yes, from a Protocol fee.<br>
(not currently on in Uniswap) can be implemented by Governance token.<br>

