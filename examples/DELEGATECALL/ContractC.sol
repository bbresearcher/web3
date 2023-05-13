// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "../lib/forge-std/src/console.sol";
contract ContractC is ERC20{
    address public contractA;
    string public  contractMsg;

    error notContractA(address caller);
    event itGotHere();
    event constructed(address conA);
    modifier onlyContractA(){
        console.log("---------------Output From ContactC Modifier-----------------------");
        console.log("[MODIFIER] Expecting address : ",contractA, " | ");
        console.log("[MODIFIER] msg.sender is : ",msg.sender, " | ");
        console.log("---------End of Output From ContactC Modifier-----------------------");
        console.log("");
        if(msg.sender != contractA) revert notContractA(msg.sender);
        _;
    }
    constructor(address _contractA) ERC20("TEST TOKEN", "TTOKEN"){
        contractA = _contractA;
        console.log("---------------Output From ContractC Constructor-------------------");
        console.log("| [CONSTRUCTOR] We contructed contractC with : " ,_contractA, " | ");
        console.log("--------End Of Output From ContractC Constructor-------------------");
        console.log("");
    }

    function setContractA(address _contractA) external {
        console.log("---------------Output From ContractC setContractA function --------");
        console.log("| [setConstractA] Setting ContractA address to : ", _contractA, " |");
        console.log("--------End Of Output From ContractC setContractA -----------------");
        console.log("");
        contractA = _contractA;
    }

    function receiveCall(address bob) external payable onlyContractA {
        console.log("---------------Output From ContractC receiveCall function ---------");
        console.log("| [receiveCall] receiveCall in ContractC received payable amount of : ", msg.value, " |");
        console.log("--------End Of Output From ContractC receiveCall ------------------");
        console.log("");
        _mint(bob,100 ether);
        contractMsg = "This value was set in ContractC";
        emit itGotHere();
    }
}
