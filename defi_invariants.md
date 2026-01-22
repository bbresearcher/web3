# Possible list of suggested DeFi Protocol Invariants for Fuzzing

## Universal Invariants (Apply to Most Protocols)

### Accounting Invariants
- **Solvency**: `totalAssets >= totalLiabilities` at all times
- **Conservation of value**: Sum of all balances before operation = Sum after operation (minus fees)
- **No inflation**: Total supply of tokens shouldn't increase unexpectedly
- **Balance consistency**: `balanceOf(user) <= totalSupply` for all users

### Access Control Invariants
- **Permission boundaries**: Privileged functions only callable by authorized addresses
- **Role immutability**: Critical roles cannot be changed without proper timelock/governance
- **Reentrancy protection**: State changes complete before external calls

### Math & Precision Invariants
- **No overflow/underflow**: All arithmetic operations stay within bounds
- **Rounding consistency**: Rounding always favors the protocol (or is documented)
- **Precision loss bounds**: Accumulated precision loss stays within acceptable limits

---

## Vault Invariants (ERC-4626 & Similar)

### Share Price Invariants
- **Share price non-decreasing**: `pricePerShare(t+1) >= pricePerShare(t)` (except during losses)
- **First depositor protection**: First deposit cannot manipulate share price significantly
- **Deposit/withdraw symmetry**: `withdraw(deposit(x)) ≈ x` (minus fees)

### Asset Management
- **Total assets formula**: `totalAssets = idle + invested + rewards - fees`
- **Share-asset relationship**: `totalAssets * shares / totalSupply = user's assets`
- **Withdrawal limits**: `maxWithdraw(user) <= balanceOf(user) * pricePerShare`
- **No locked funds**: Sum of all user withdrawable amounts = total vault assets (or explicitly tracked locked amounts)

### Strategy Invariants
- **Strategy allocation**: Sum of all strategy allocations <= total assets
- **Loss accounting**: Realized losses decrease total assets appropriately
- **Harvest monotonicity**: Harvesting should not decrease user positions

---

## AMM/DEX Invariants

### Constant Product (Uniswap v2 style)
- **K invariant**: `reserve0 * reserve1 >= k` (k increases only via fees)
- **Price impact bounds**: Large trades shouldn't drain reserves completely
- **Minimum liquidity**: First LP mints minimum liquidity to address(0)

### Concentrated Liquidity (Uniswap v3 style)
- **Tick math**: Current tick always represents actual price
- **Liquidity accounting**: Sum of position liquidities = total liquidity at tick
- **Fee accumulation**: Fees accrue monotonically
- **Position solvency**: `tokensOwed0 + tokensOwed1` can always be collected

### General DEX Invariants
- **No arbitrage creation**: Swaps shouldn't create immediate profitable arbitrage
- **Slippage protection**: Actual output >= minAmountOut
- **Fee extraction**: Fees removed from swap amounts, not added to reserves incorrectly

---

## TWAP (Time-Weighted Average Price) Invariants

### Oracle Invariants
- **Monotonic timestamps**: Observations have strictly increasing timestamps
- **Price continuity**: Price changes align with actual trades
- **Cardinality limits**: Observation array doesn't exceed max cardinality
- **TWAP bounds**: TWAP value stays within min/max observed prices over period

### Manipulation Resistance
- **Multi-block requirement**: TWAP can't be manipulated within single block
- **Observation spacing**: Sufficient observations exist for requested period
- **No zero values**: TWAP never returns zero unless pool is uninitialized

---

## Lending Protocol Invariants

### Collateralization
- **Overcollateralization**: `collateralValue * LTV > borrowedValue` for all users
- **Liquidation threshold**: `healthFactor = collateralValue / (borrowedValue * liquidationThreshold)`
- **Minimum health**: All non-liquidatable positions have `healthFactor >= 1`

### Interest Rate Model
- **Utilization bounds**: `0 <= utilization <= 100%`
- **Rate monotonicity**: Higher utilization → higher interest rates
- **Index growth**: `borrowIndex` and `supplyIndex` only increase over time
- **Interest accrual**: `newIndex = oldIndex * (1 + rate * timeDelta)`

### Supply/Borrow Balance
- **Market solvency**: `totalSupplied >= totalBorrowed` for each market
- **User balance**: `userSupply - userBorrow >= 0` (in value terms with LTV)
- **Reserve factor**: `reserves = totalBorrowInterest * reserveFactor`

---

## Liquidation Invariants

### Liquidation Mechanics
- **Only underwater positions**: Liquidations only possible when `healthFactor < 1`
- **Liquidation bonus bounds**: `1 <= liquidationBonus <= maxBonus`
- **Partial liquidation**: Partial liquidations bring health factor to safe level
- **Close factor**: `amountLiquidated <= debtBalance * closeFactor`

### Economic Soundness
- **Profitability**: Liquidator receives `collateral > debt + gas costs`
- **Protocol protection**: Liquidations improve protocol solvency
- **Bad debt handling**: If collateral < debt, bad debt is recorded, not ignored

---

## NFT Protocol Invariants

### ERC-721 Compliance
- **Unique ownership**: Each tokenId has exactly one owner (or is unowned)
- **Transfer atomicity**: Transfers complete fully or revert entirely
- **Approval clarity**: Approvals are correctly set/cleared on transfers

### NFT Lending/Collateral
- **NFT custody**: Protocol holds NFT when it's collateral for active loan
- **Ownership restoration**: NFT returned to owner on loan repayment
- **Liquidation rights**: Only liquidatable if loan conditions breached

### Fractionalization
- **Fraction sum**: Sum of all fractions = 1 (or total supply)
- **Redemption**: Fraction holders can recombine to claim underlying NFT
- **Buyout consistency**: Buyout price calculations are manipulation-resistant

---

## Staking Invariants

### Reward Distribution
- **Reward rate**: `totalRewardsDistributed <= rewardRate * timeElapsed + initialRewards`
- **Pro-rata distribution**: User rewards proportional to stake and time
- **No double claiming**: Each reward claimed only once
- **Reward index**: `rewardPerTokenStored` only increases

### Staking Mechanics
- **Stake accounting**: `totalStaked = sum(userStakes)`
- **Lock periods**: Tokens locked for minimum period if applicable
- **Cooldown**: Unstaking respects cooldown periods
- **Slash protection**: Slashing events properly decrease total staked

---

## Bridge Invariants

### Cross-Chain Consistency
- **Supply parity**: `totalSupplyOnChainA + totalSupplyOnChainB = totalSupply`
- **Message uniqueness**: Each cross-chain message processed exactly once
- **Nonce ordering**: Messages processed in correct order

### Security
- **Deposit before mint**: Tokens locked on source before minting on destination
- **Burn before release**: Tokens burned on source before releasing on destination
- **Rate limiting**: Large transfers may be delayed or split

---

## Governance Invariants

### Voting
- **Vote power**: `votePower <= totalSupply` at snapshot block
- **Double voting**: Each address votes once per proposal
- **Quorum**: `votesFor + votesAgainst >= quorum` to pass
- **Timelock**: Critical changes delayed by timelock period

### Proposal Lifecycle
- **State transitions**: Proposals follow valid state machine
- **Execution conditions**: Only executable after timelock and if passed
- **Cancellation rights**: Only proposer or guardian can cancel

---

## Flash Loan Invariants

### Atomicity
- **Return requirement**: `endingBalance >= startingBalance + fee`
- **Same transaction**: Borrow and repay in same transaction
- **Reentrancy protection**: No nested flash loans (unless explicitly allowed)

### Economic
- **Fee collection**: Fees properly accrued to protocol
- **No free loans**: Zero-amount flash loans either blocked or fee-charged

---

## General Testing Strategies

### Property Categories
1. **State transition properties**: Valid states remain valid after operations
2. **Economic properties**: No value creation/destruction except via fees/yield
3. **Access control properties**: Unauthorized actions always revert
4. **Integration properties**: Protocol interactions don't break invariants
5. **Boundary properties**: Edge cases (0 amounts, max values) handled correctly

### Fuzzing Approach
- Test invariants across random valid state transitions
- Use stateful fuzzing for multi-step workflows
- Include edge cases: zero amounts, maximum values, minimum precision
- Test with multiple actors to find race conditions
- Combine operations in unexpected orders
- Test emergency pause/unpause scenarios
