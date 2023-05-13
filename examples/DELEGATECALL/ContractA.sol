// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "./ContractB.sol";
contract ContractA {
    address public contractB;

    function setContractB(address _contractB) external {
        contractB = _contractB;
    }

    function callB(address bob) external payable{
        ContractB conB = ContractB(contractB);
        console.log("---------------Output From ContractA callB function -------------");
        console.log("| [callB] ABOUT TO CALL CONTRACT B WITH 1 ETH MSG.VALUE |");
        console.log("--------End Of Output From ContractA callB ----------------------");
        console.log("");
        conB.receiveCall{value: 1 ether}(bob);
    }
}
