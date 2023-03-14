# Smart Contract token list:<br>
Summary of information at [https://ethereum.org/en/developers/docs/standards/tokens/](https://ethereum.org/en/developers/docs/standards/tokens/)<br>
## ERC20:<br>
```
	function name() public view returns (string)
	function symbol() public view returns (string)
	function decimals() public view returns (uint8)
	function totalSupply() public view returns (uint256)
	function balanceOf(address _owner) public view returns (uint256 balance)
	function transfer(address _to, uint256 _value) public returns (bool success)
	function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
	function approve(address _spender, uint256 _value) public returns (bool success)
	function allowance(address _owner, address _spender) public view returns (uint256 remaining)

	event Transfer(address indexed _from, address indexed _to, uint256 _value)
	event Approval(address indexed _owner, address indexed _spender, uint256 _value)
```

## ERC721:<br>
```
	function balanceOf(address _owner) external view returns (uint256);
	function ownerOf(uint256 _tokenId) external view returns (address);
	function safeTransferFrom(address _from, address _to, uint256 _tokenId, bytes data) external payable;
	function safeTransferFrom(address _from, address _to, uint256 _tokenId) external payable;
	function transferFrom(address _from, address _to, uint256 _tokenId) external payable;
	function approve(address _approved, uint256 _tokenId) external payable;
	function setApprovalForAll(address _operator, bool _approved) external;
	function getApproved(uint256 _tokenId) external view returns (address);
	function isApprovedForAll(address _owner, address _operator) external view returns (bool);
	event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
	event Approval(address indexed _owner, address indexed _approved, uint256 indexed _tokenId);
	event ApprovalForAll(address indexed _owner, address indexed _operator, bool _approved);
	
```
	Hooks and details:
	https://eips.ethereum.org/EIPS/eip-721
## ERC777:<br>
```
	ERC20 Backwards compatible adds hooks
	https://eips.ethereum.org/EIPS/eip-777
	Hooks : Sender 	-> 	tokesToSend
		Receiver->	tokensReceived
 ```   
## ERC1155:<br>
```
	// ERC-20
	function transferFrom(address from, address to, uint256 value) external returns (bool);

	// ERC-1155
	function safeBatchTransferFrom(
	    address _from,
	    address _to,
	    uint256[] calldata _ids,
	    uint256[] calldata _values,
	    bytes calldata _data
	) external;
	// ERC-20
	function balanceOf(address owner) external view returns (uint256);

	// ERC-1155
	function balanceOfBatch(
	    address[] calldata _owners,
	    uint256[] calldata _ids
	) external view returns (uint256[] memory);
	[
	    balanceOf(0xbeef...),
	    balanceOf(0x1337...),
	    balanceOf(0x1111...)
	]
	// ERC-1155
	function setApprovalForAll(
	    address _operator,
	    bool _approved
	) external;

	function isApprovedForAll(
	    address _owner,
	    address _operator
	) external view returns (bool);
	function onERC1155BatchReceived(
	    address _operator,
	    address _from,
	    uint256[] calldata _ids,
	    uint256[] calldata _values,
	    bytes calldata _data
	) external returns(bytes4);
```
## ERC4626:<br>
```
	function asset() public view returns (address)
	function totalAssets() public view returns (uint256)
	function convertToShares(uint256 assets) public view returns (uint256 shares)
	function convertToAssets(uint256 shares) public view returns (uint256 assets)
	function maxDeposit(address receiver) public view returns (uint256)
	function previewDeposit(uint256 assets) public view returns (uint256)
	function deposit(uint256 assets, address receiver) public returns (uint256 shares)
	function maxMint(address receiver) public view returns (uint256)
	function previewMint(uint256 shares) public view returns (uint256)
	function mint(uint256 shares, address receiver) public returns (uint256 assets)
	function maxWithdraw(address owner) public view returns (uint256)
	function previewWithdraw(uint256 assets) public view returns (uint256)
	function withdraw(uint256 assets, address receiver, address owner) public returns (uint256 shares)
	function maxRedeem(address owner) public view returns (uint256)
	function previewRedeem(uint256 shares) public view returns (uint256)
	function redeem(uint256 shares, address receiver, address owner) public returns (uint256 assets)
	function totalSupply() public view returns (uint256)
	function balanceOf(address owner) public view returns (uint256)
	event Deposit(
	    address indexed sender,
	    address indexed owner,
	    uint256 assets,
	    uint256 shares
	)
	event Withdraw(
	    address indexed sender,
	    address indexed receiver,
	    address indexed owner,
	    uint256 assets,
	    uint256 share
	)
  ```
