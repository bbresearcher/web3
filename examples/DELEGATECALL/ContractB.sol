// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "./ContractC.sol";
contract ContractB is ERC20{
    address public contractA;
    string public  contractMsg;
    address public contractC;
    

    error notContractA(address caller);

    modifier onlyContractA(){
        if(msg.sender != contractA) revert notContractA(msg.sender);
        _;
    }
    constructor(address _contractC,address _contractA)  ERC20("TEST TOKEN", "TTOKEN"){
        contractA = _contractA;
        contractC = _contractC;
        contractMsg = "This was value was set in the constructor";
    }

    function setContractA(address _contractA) external {
        console.log("---------------Output From ContactB setContractA function --------");
        console.log("| [setConstractA] Setting ContractA address to : ", _contractA, " |");
        console.log("---------------Output From ContactB setContractA-------------------");
        console.log("");
        contractA = _contractA;
    }

    function receiveCall(address bob) external payable onlyContractA{

        (bool success, bytes memory data) = contractC.delegatecall(
            abi.encodeWithSignature("receiveCall(address)",bob));
    }
    
}
