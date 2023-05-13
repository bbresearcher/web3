// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/ContractA.sol";
import "../src/ContractB.sol";
import "../src/ContractC.sol";

contract DelegateTest is Test {
    ContractA public contractA;
    ContractB public contractB;
    ContractC public contractC;
    address bob;


    function setUp() public {
        bob = vm.addr(1);
        contractA = new ContractA();
        contractC = new ContractC(address(contractA));
        contractB = new ContractB(address(contractC),address(contractA));
        contractA.setContractB(address(contractB));
        //UNCOMMENT BELOW IF YOU WOUL LIE TO SEE THE CONTRACT ADDRESSES AS THE ARE CONSTRUCTED
        //console.log("-------------------------------------------------------------------");
        //console.log("| Address of ContractA is : ",address(contractA), " | ");
        //console.log("-------------------------------------------------------------------");
        //console.log("");
        //console.log("-------------------------------------------------------------------");
        //console.log("| Address of ContractB is : ",address(contractB), " | ");
        //console.log("-------------------------------------------------------------------");
        //console.log("");
        //console.log("-------------------------------------------------------------------");
        //console.log("| Address of ContractC is : ",address(contractC), " | ");
        //console.log("-------------------------------------------------------------------");
        //console.log("");
    }

    function testCallBSuccess() public {
        contractA.callB{value: 5 ether}(bob);
        // NB IN THE OUTPUT YOU WILL SEE THE MINTED TOKENS IN THE CALL OF CONTRACTC 
        // ACTUALLY MINT TOKENS FROM CONTRACTB.
        console.log("-------------------------------------------------------------------");
        console.log("| The value of the variable contractMsg in ContractB is : ", contractB.contractMsg(), " |");
        console.log("-------------------------------------------------------------------");
        console.log("");
        console.log("-------------------------------------------------------------------");
        console.log("| Bob's balance of contract B TToken : ", contractB.balanceOf(bob), " |");
        console.log("-------------------------------------------------------------------");
        console.log("");
        console.log("-------------------------------------------------------------------");
        console.log("| Bob's balance of contract C TToken : ", contractC.balanceOf(bob), " |");
        console.log("-------------------------------------------------------------------");
        console.log("");
    }

    function testCallBFail() public {
        address random = address(1234);
        // NB NOTICE HOW WE ARE SETTING THE VALUE OF THE ADDRESS OF CONTRACTA
        // IN CONTRACT B TO MAKE THE MODIFIER IN CONTRACTC FAIL
        // THIS HAPPENS BECAUSE DELEGATE CALL USES THE MSG.SENDER, MSG.VALUE AND STORAGE OF 
        // THE DELEGATING CONTRACT.
        contractB.setContractA(random);
        // WE EXPECT THE MODIFIER TO FAIL AS ADDRESS OF CONTRACTA SHOULD BE WRONG
        // THERE WILL BE NO OUTPUT FROM THE MODIFIER CHECK.
        vm.expectRevert();
        // JUST SENDING 5 ETH SO CONTRACT A HAS ETH FOR IT'S CALL
        // SENDIG 5 JUST SO THAT THE VALUES ARE DIFFERENT
        contractA.callB{value:5 ether}(bob);
    }
}
