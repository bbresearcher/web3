// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "forge-std/console.sol";

contract DeleteTest is Test {
    mapping (uint256 => uint256) public mapper;
    uint256[8] localArray;
    localStruct _localStruct;

    struct localStruct {
        uint256 valA;
        uint256 valB;
    }
    function setUp() public {
        mapper[0] = 1;
        mapper[1] = 2;
        mapper[2] = 3;
        mapper[3] = 4;
        mapper[4] = 5;
        mapper[5] = 6;
        mapper[6] = 7;
        mapper[7] = 8;
        mapper[8] = 9;

        localArray[0] = 1;
        localArray[1] = 2;
        localArray[2] = 3;
        localArray[3] = 4;
        localArray[4] = 5;
        localArray[5] = 6;
        localArray[6] = 7;
        localArray[7] = 8;

        _localStruct.valA = 10;
        _localStruct.valB = 20;


    }

    function testDeleteMapping() public {
       console.log("--------------------------------------------------------");
       console.log("|  MAPPER : Values before Delete                        |");
       console.log("--------------------------------------------------------");
       for(uint256 i;i<9;i++)
       {
        console.log("[+] The value at mapper(",i,") is : " ,mapper[i]);
       }
       console.log("--------------------------------------------------------");

       //now delete a mapping entry
       delete mapper[3];

       console.log("--------------------------------------------------------");
       console.log("|  MAPPER : Values after Delete  mapper[3]              |");
       console.log("--------------------------------------------------------");
       for(uint256 i;i<9;i++)
       {
        console.log("[+] The value at mapper(",i,") is : " ,mapper[i]);
       }
       console.log("--------------------------------------------------------");
    }

    function testDeletArray() public {
       console.log("--------------------------------------------------------");
       console.log("|  ARRAY : Values before Delete                        |");
       console.log("--------------------------------------------------------");
       for(uint256 i;i<8;i++)
       {
        console.log("[+] The value at localArray(",i,") is : " ,localArray[i]);
       }
       console.log("--------------------------------------------------------");

       //now delete a localArray entry
       delete localArray[3];

       console.log("--------------------------------------------------------");
       console.log("|  ARRAY : Values after Delete  localArray[3]           |");
       console.log("--------------------------------------------------------");
       for(uint256 i;i<8;i++)
       {
        console.log("[+] The value at localArray(",i,") is : " ,localArray[i]);
       }
       console.log("--------------------------------------------------------");
    }

    function testDeleteStruct() public {
       console.log("--------------------------------------------------------");
       console.log("|  STRUCT : Value before Delete                         |");
       console.log("--------------------------------------------------------");
       console.log("[+] The values in _localStruct are valA : " ,_localStruct.valA, " and valB : ", _localStruct.valB);
       console.log("--------------------------------------------------------");

       //now delete a localArray entry
       delete _localStruct;
       
       console.log("--------------------------------------------------------");
       console.log("|  STRUCT : Values after Delete  _localStruct           |");
       console.log("--------------------------------------------------------");
       console.log("[+] The values in _localStruct are valA : " ,_localStruct.valA, " and valB : ", _localStruct.valB);
       console.log("--------------------------------------------------------");
    }

}
