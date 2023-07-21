## Purpose
The code in this directory is an example of how you may be able to log you foundry fuzz test input values to a file.

## SETUP
1. Install OpenZeppelin String utils with `forge install OpenZeppelin/openzeppelin-contracts`
2. Add Config to your foundry.toml file to enable file access. See foundry.toml file in this directory
3. Configure your remappings file. see remapping.txt in this directory.
4. Import the Strings utils in your Foundry test file and use the logger function at the bottom of the file. See Counter.t.sol in this directory
