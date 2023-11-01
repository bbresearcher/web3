## How to deploy and test a proxy contract using Foundry
1) create new folder (any name is fine)
2) run `forge init --no-git`
3) run  `forge install OpenZeppelin/openzeppelin-contracts-upgradeable --no-git`
4) create file Implementation.sol in src directory
5) copy/paste below code
```
// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import {Initializable} from  "lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/Initializable.sol";
import {UUPSUpgradeable} from "lib/openzeppelin-contracts-upgradeable/contracts/proxy/utils/UUPSUpgradeable.sol";
import {OwnableUpgradeable} from "lib/openzeppelin-contracts-upgradeable/contracts/access/OwnableUpgradeable.sol";

// Adapted from Openzeppelin BOX example
// https://docs.openzeppelin.com/defender/v2/tutorial/deploy
contract Implementation is Initializable, UUPSUpgradeable, OwnableUpgradeable {


    /// @notice No constructor in upgradable contracts, so initialized with this function.
    function initialize(address _newOwner) public initializer {
        
        __UUPSUpgradeable_init();
        __Ownable_init(_newOwner);


        // Initialize OwnableUpgradeable explicitly with given address.
        transferOwnership(_newOwner);
    }

    function getOwner() public view returns (address){
        return owner();
    }

    /// @dev Upgrades the implementation of the proxy to new address.
    function _authorizeUpgrade(address) internal override onlyOwner {}
}
```

6) create file Proxytest.t.sol in test directory
7) copy/paste code below
```
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Implementation.sol";
import "lib/openzeppelin-contracts-upgradeable/lib/openzeppelin-contracts/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";

contract ProxyTest is Test {
   
    address proxy;
    address public implementation;
    address public proxyowner = makeAddr("proxyowner");
    address public deployer = makeAddr("deployer");

    function setUp() public {
        vm.startPrank(deployer);
        Implementation impContract = new Implementation();
        bytes memory initbytes = abi.encodeCall(impContract.initialize, deployer);
        proxy = address(new TransparentUpgradeableProxy(address(impContract),deployer,initbytes));
        vm.stopPrank();
    }

    function testInit() public {
        console.log("The declared address of 'proxyowner' is : ",proxyowner);
        console.log("The owner in the proxy is : ",Implementation(proxy).getOwner());
    }
}
```

8) Run test and experiment with different configs
`forge test --match-contract ProxyTest -vv`
