// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IERC20 {
    function name() external view returns(string memory); // Our Token Name

    function symbol() external view returns(string memory);//Short Name of our Token

    function decimals() external pure returns(uint); // shows how many characters are after the decimal point For example 18 i EMC == 1 wei 

    function totalSupply() external view returns(uint); //STANDART total supply

    function balanceOf(address _account) external view returns(uint);//STANDART shows the number of our tokens in the desired account

    function transfer(address _to, uint _amount) external; //STANDART alternative to transfer function for uour tokens

    function allowance(address _owner, address spender) external view returns(uint);//STANDART  to allow another account to grab our tokens

    function approve(address spender, uint amount) external;//STANDART  addmit it WHO can and Ammount

    function transferFrom(address sender, address recipient, uint amount) external;//STANDART  transfer from which one to another one WE MUST TO APPROVE before

    event Transfer(address indexed from, address indexed to, uint amount);// event

    event Approve(address indexed owner, address indexed to, uint amount);// event
}