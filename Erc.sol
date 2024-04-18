// SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "./IERC20.sol";

contract ERC20 is IERC20
{ 	
	uint totalTokens;
	address owner;
	mapping(address=>uint) balances;
	mapping(address=> mapping(address => uint)) allowance; // it stores the details of accounts that are allowed to write off their tokens
	string _name;//name of our token
	string _symbol;//symbol of our token
	function name() external view returns(string memory)//show us name of our token
	{
		return _name;
	}
	function symbol() external view returns(string memory)//show us symbol of our token
	{
		return _symbol;
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
	constructor(string memory name_, string memory symbol_, uint initialSupply, address shop )
	{
		_name = name_;
		_symbol = symbol_;
		owner = msg.sender;
		mint(initialSupply,shop);

	}
	function mint (uint amount, address shop) public onlyOwner
	{
		balances[shop] += amount;
		totalTokens += amount;
	}

	//OTHER IN PROCESS 

}