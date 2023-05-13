## DelegateCall
DeleteCall sends the call through to another contract. When the code is run at the other contract the **msg.value**,**msg.sender** and **storage** of the delegating contract are used.
As a developer or auditor you need to keep this in mind as delegating a call to an external contract will allow that external contract access to variables and functionality of your contract.
**Notice** the value of the ***contractMsg*** variable and where it is set in the output.
If you would really like to test how storage works play around with the order of the variables in **ContractB and ContractC**.

Included in this repository are files to test this concept.

## Running the example
1. Commands to run to initiate directory
```
mkdir example_dir
cd example_dir
forge init --no-git
forge install --no-git OpenZeppelin/openzeppelin-contracts
```
2. Copy to files to the correct directories
3. ContractA.sol, ContractB.sol and ContractC.sol to the src directory.
4. DelegateTest.t.sol to the test directory.
5. Test with ```forge test -vv```

## Output
Below is the output ypu will get from running the `forge test -vv` command.

```text
Running 2 tests for test/DelegateTest.t..sol:DelegateTest
[PASS] testCallBFail() (gas: 45934)
Logs:
  ---------------Output From ContractC Constructor-------------------
  | [CONSTRUCTOR] We contructed contractC with :  0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f  | 
  --------End Of Output From ContractC Constructor-------------------
  
  ---------------Output From ContactB setContractA function --------
  | [setConstractA] Setting ContractA address to :  0x00000000000000000000000000000000000004d2  |
  ---------------Output From ContactB setContractA-------------------
  
  ---------------Output From ContractA callB function -------------
  | [callB] ABOUT TO CALL CONTRACT B WITH 1 ETH MSG.VALUE |
  --------End Of Output From ContractA callB ----------------------
  

[PASS] testCallBSuccess() (gas: 121503)
Logs:
  ---------------Output From ContractC Constructor-------------------
  | [CONSTRUCTOR] We contructed contractC with :  0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f  | 
  --------End Of Output From ContractC Constructor-------------------
  
  ---------------Output From ContractA callB function -------------
  | [callB] ABOUT TO CALL CONTRACT B WITH 1 ETH MSG.VALUE |
  --------End Of Output From ContractA callB ----------------------
  
  ---------------Output From ContactC Modifier-----------------------
  [MODIFIER] Expecting address :  0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f  | 
  [MODIFIER] msg.sender is :  0x5615dEB798BB3E4dFa0139dFa1b3D433Cc23b72f  | 
  ---------End of Output From ContactC Modifier-----------------------
  
  ---------------Output From ContractC receiveCall function ---------
  | [receiveCall] receiveCall in ContractC received payable amount of :  1000000000000000000  |
  --------End Of Output From ContractC receiveCall ------------------
  
  -------------------------------------------------------------------
  | The value of the variable contractMsg in ContractB is :  This value was set in ContractC  |
  -------------------------------------------------------------------
  
  -------------------------------------------------------------------
  | Bob's balance of contract B TToken :  100000000000000000000  |
  -------------------------------------------------------------------
  
  -------------------------------------------------------------------
  | Bob's balance of contract C TToken :  0  |
  -------------------------------------------------------------------
  

Test result: ok. 2 passed; 0 failed; finished in 15.35ms
```
