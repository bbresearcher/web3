// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Counter.sol";
import "lib/openzeppelin-contracts/contracts/utils/Strings.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter();
        counter.setNumber(0);
    }

    function testIncrement() public {
        counter.increment();
        assertEq(counter.number(), 1);
    }

    /// LOGGING HAS BEEN ADDED TO THIS FUZZ TEST BELOW
    function testSetNumber(uint256 x) public {
        // SET UP LOGGING INPUTS -- This can be altered to be large arrays as needed
        string[] memory inputX = new string[](1);
        string[] memory FieldNames = new string[](1);
        // SET ACTUAL VALUES TO LOG
        inputX[0] = Strings.toString(x);
        FieldNames[0] = "x";
        // CALL LOGGING FUNCTION
        logFuzzerValues("testSetNumber",inputX,FieldNames);
        counter.setNumber(x);
        assertEq(counter.number(), x);
    }

    /// @dev This function logs fuzzer runs values used per test
    /// 
    /// @param _testName Use an identifier for the test you are logging eg. testFuzzAddition
    /// @param _fields The field names that will be pseudo randomly generated
    /// @param _fieldValues The field values associated with fields names
    function logFuzzerValues(string memory _testName,string[] memory _fields, string[] memory _fieldValues) public {
        require(_fields.length == _fieldValues.length,"logFuzzerValues: Input arrays not the same length");
            
        string memory _file = string.concat(_testName,".log");  
        for(uint256 i; i < _fields.length; i++)
        {
            vm.writeLine(_file, string.concat( _fieldValues[i] , " = " , _fields[i]));
        } 
    }

}
