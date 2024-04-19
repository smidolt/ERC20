// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "./IERC20.sol";

contract ERC20 is IERC20 
{ 	
	uint totalTokens;
	address owner;
	mapping(address=>uint) balances;
	mapping(address=> mapping(address => uint)) allowances; // it stores the details of accounts that are allowed to write off their tokens
	string _name;//name of our token
	string _symbol;//symbol of our token
	constructor(string memory name_, string memory symbol_, uint initialSupply, address shop )
	{
		_name = name_;
		_symbol = symbol_;
		owner = msg.sender;
		mint(initialSupply,shop);

	}
	modifier enoughTokens(address _from, uint _ammount)
	{
		require(balanceOf(_from)>= _ammount, "not enough tokens");
		_;
	}
	modifier onlyOwner()
	{
		require(owner == msg.sender, "not an owner");
		_;
	}
	function mint (uint ammount_, address _shop) public onlyOwner
	{
		_beforeTokenTransfer(address(0), _shop, ammount_ );
		balances[_shop] += ammount_;
		totalTokens += ammount_;
		emit Transfer(address(0), _shop, ammount_);
	}
	function burn(address _from, uint _ammount)public onlyOwner enoughTokens( _from, _ammount)
	{
		_beforeTokenTransfer(_from, address(0), _ammount);
		balances[_from] -= _ammount;
		totalTokens -= _ammount;
	}
	function name() external view returns(string memory)//show us name of our token
	{
		return _name;
	}
	function symbol() external view returns(string memory)//show us symbol of our token
	{
		return _symbol;
	}
	function decimals() external pure returns(uint)
	{
		return 18;
	}
	function totalSupply() external view returns(uint)
	{
		return totalTokens;
	}
		
	function balanceOf(address _address) public view returns(uint)
	{
		return balances[_address];
	}

	function transfer(address _to, uint _amount) external enoughTokens(msg.sender, _amount)
	{
		_beforeTokenTransfer(msg.sender, _to, _amount);
		balances[msg.sender] -= _amount;
		balances[_to] += _amount;
		emit Transfer(msg.sender, _to, _amount);
	}
	function allowance(address _owner, address spender) public view returns(uint)
	{
		return allowances[_owner][spender]; // we allow _owner to transfer to  sender  uint ammount HOW MUCH WE WILL TAKE
	}
	function approve(address spender, uint amount) external //How much we allowed to take
	{
		_approve(msg.sender, spender, amount);
	}
	function _approve(address sender, address spender, uint amount)internal virtual
	{
		allowances[sender][spender]=amount;
		emit Approve(sender, spender, amount);
	}
	function transferFrom(address sender, address recipient, uint amount) public enoughTokens(sender, amount)
	{
		_beforeTokenTransfer(sender,recipient, amount);
		require(allowances[sender][recipient]>=amount,"Check allowance");
		allowances[sender][recipient]-=amount;

		balances[sender] -= amount;
		balances[recipient] += amount;
		emit Transfer(sender, recipient, amount);

	}


	function _beforeTokenTransfer
	(
		address from,
		address to,
		uint amount
	)internal virtual 
	{

	}
}