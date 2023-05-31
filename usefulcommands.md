Pashov tweeted:<br>
Doing `forge coverage --report lcov` and then using the Coverage Gutters VS code extension to colour out the non-tested source code can really help you find more bugs - I personally have found security vulnerabilities this way 
<hr>
If you are interacting with a contract that uses the PUSH0 opcode and it's failing with "EvmError: NotActivated", this tip might solve it... create a .env file and paste FOUNDRY_EVM_VERSION = "shanghai", into it, that might solve the issue.
<hr>
