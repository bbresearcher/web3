## Purpose
The code in this directory is an example of how you may be able to log foundry fuzz test input values to a file.

## SETUP
1. Install OpenZeppelin String utils with `forge install OpenZeppelin/openzeppelin-contracts`
2. Add Config to your foundry.toml file to enable file access. See foundry.toml file in this directory
3. Configure your remappings file. See remappings.txt in this directory.
4. Import the Strings utils in your Foundry test file and use the logger function at the bottom of the file. See Counter.t.sol in this directory

## BTW
I have added the Counter.sol file so that testing quckly will be easier. See Counter.sol

## RUN
To run issue the `forge test` command.

## OUTPUT
A file with the name you configure in the test will be written into your root directory of your project.
