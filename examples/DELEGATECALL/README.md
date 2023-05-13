## DelegateCall
DeleteCall sends the call through to another contract. When the code is run at the other contract the **msg.value**,**msg.sender** and **storage** of the delegating contract are used.

Included in this repository are files to test this concept.

## Running the example

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
  

[PASS] testCallBSuccess() (gas: 109451)
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
  | Bob's balance of contract B TToken :  100000000000000000000  |
  -------------------------------------------------------------------
  
  -------------------------------------------------------------------
  | Bob's balance of contract C TToken :  0  |
  -------------------------------------------------------------------
  

Test result: ok. 2 passed; 0 failed; finished in 18.46ms
```
