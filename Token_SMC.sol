// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "./Erc.sol";
contract SMC is ERC20
{
constructor(address shop)ERC20("SmidoltTocken","SMC", 100, shop) //we go up and call the constructor 
{

}
}