## A repository for WEB3 101 and things I have learned to share my learning journey<br/>
## NB!!! DISCLAIMER: All information is as I understand it but please verify the correctness of it, this repository is not meant to be an authoritative source of information.
## Concepts
### What is ETH 2.0
Proof of Stake vs Proof of Work, this introduces sharding which increases speed and throughput.

### What is Layer 2
Layer 2 is transactions/computing off of Layer1 (Mainnet) to lower costs and increase speed.
current scaling solutions
- Channels (State and payment channels, allows users to share transactions many time while only submitting 2 transactions.) (application specific no open participation cant be used to scale general smart contracts)RADEUM
- Plasma framework for building apps on ethereum.OMG
- Side chains ETH compatible blockchains
- Rollups bundle TX in a single TX (SNARK) ZK ROLLUPS AND OPTIMISTIC ROLLUPS (OVM)

### What is the EVM
[Spearbit EVM info video](https://www.youtube.com/watch?v=XhfaG6cYulU)<br/>
[A Low-Level Guide To Solidity's Storage Management](https://degatchi.com/articles/low_level_guide_to_soliditys_storage_management)<br/>
Ethereum Virtual Machine (EVM)<br/>
Quasi-turing complete<br/>
State machine<br/>
1) List accounts and balances.<br/>
2) List of Smart Contracts and their data.

### Ethereum Transaction structure
- From
- To (zeros is deploy new contract)
- Value
- Data/Input
- Gas Price
- Gas Limit
- Nonce
- v,r,s

### What is GAS Optimisation
Optimizing the smart contract code to minimise the amount of computational resources used by EVM<br/>
https://www.alchemy.com/overviews/solidity-gas-optimization

### What is the ETH ENS
Ethereum Name Service (ENS)<br/>
Its like a DNS for the blockchain, it supports sub-domains and the owner can configure them.<br/>
Link: https://docs.ens.domains/ <br/>
top level domains are owned by owner contract eg. <b>.eth</b> and <b>.test</b><br/>
Can be used by a user or a contract.<br/>

### What is a proxy
https://docs.openzeppelin.com/contracts/4.x/api/proxy<br/>
A proxy is an abstract contract that uses delegation.<br/>
TPP(Transparent Proxy Pattern)<br/>
UUPS (Upgradeable Proxy Standard (UUPS))<br/>

### When is a proxy unintialized and how to check
[yAcademy proxy security](https://proxies.yacademy.dev/pages/security-guide/)<br/>
### What is Compound

### What is OpenZeppelin
OpenZeppelin provides a complete suite of security products to build, manage, and inspect all aspects of software development and operations for Ethereum projects.
### What is UniSwap and how does it work
Automated Liquidity Pool, EthToToken,TokenToEth or tokenToToken swaps<br/>
You can itneract via a factory class<br/>
Can also create your own exchange<br/>
Price of Eth/Token is controlled by the pool balances.<br/>

### What is MasterChef

### What was the DAO Hack
Smart contract called DAO, was the largest crowd fund at that point, it was a reentrancy hack on fallback function<br/>

### What is an Oracle and how can it be manipulated
An Oracle is a datasource from off chain eg. Currency conversions<br/>
To solve the decentralization issue DON's exist (Decentralized Oracle networks).<br/>
- Input Oracles
- Output Oracles
- Cross-chain Oracles
- Compute-Enabled Oracles

Some manipulations: draining one side of a swap pool, <br/>

### WEB3 Security Best Practices
Very good resource: https://consensys.github.io/smart-contract-best-practices<br/>


