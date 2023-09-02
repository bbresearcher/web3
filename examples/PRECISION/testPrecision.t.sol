// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract testPrecisionTest is Test {        
        uint256 a = 1e1;
        uint256 b = 1e2;
        uint256 c = 1e3;
        uint256 d = 1e4;
        uint256 e = 1e5;
        uint256 f = 1e6;
        uint256 g = 1e7;
        uint256 h = 1e8;
        uint256 i = 1e9;
        uint256 j = 1e10;
        uint256 k = 1e11;
        uint256 l = 1e12;
        uint256 m = 1e13;
        uint256 n = 1e14;
        uint256 o = 1e15;
        uint256 p = 1e16;
        uint256 q = 1e17;
        uint256 r = 1e18;

        function testPrintPrecision() public {
        console.log("Value of A is : " ,a);
        console.log("Value of B is : " ,b);
        console.log("Value of C is : " ,c);
        console.log("Value of D is : " ,d);
        console.log("Value of E is : " ,e);
        console.log("Value of F is : " ,f);
        console.log("Value of G is : " ,g);
        console.log("Value of H is : " ,h);
        console.log("Value of I is : " ,i);
        console.log("Value of J is : " ,j);
        console.log("Value of K is : " ,k);
        console.log("Value of L is : " ,l);
        console.log("Value of M is : " ,m);
        console.log("Value of N is : " ,n);
        console.log("Value of O is : " ,o);
        console.log("Value of P is : " ,p);
        console.log("Value of Q is : " ,q);
        console.log("Value of R is : " ,r);
    }

    function testPrintAdd() public {
        console.log("[+] Imagine you need to add two values and expect the same precision");
        console.log("[+] Value of 1e8 + 1e18 is : " ,1e8 + 1e18);
        console.log("[+] Value of 1e18 + 1e18 is : " ,1e18 + 1e18);
    }

    function testPrintMul() public {
        console.log("[*] Imagine you need to multiply two values and expect the same precision");
        console.log("[*] Value of 1e8 * 1e18 is : " ,1e8 * 1e18);
        console.log("[*] Value of 1e18 * 1e18 is : " ,1e18 * 1e18);
    }

}
