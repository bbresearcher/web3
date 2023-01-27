- The compiler uses opcodes GT and ISZERO for solidity code that uses >, but only requires LT for >=, which saves 3 gas
- In certain instances declaring functions as payable would save on op codes without negative impact
ALLVALUE(2),DUP1(3),ISZERO(3),PUSH2(3),JUMPI(10),PUSH1(3),DUP1(3),REVERT(0),JUMPDEST(1),POP(2) about 21 gas per call.
- Use assembly to check ```address(0)```
