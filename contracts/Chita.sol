// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC20.sol";

contract Chita is ERC20
{
    // all function and variables are imported from ERC20 contract
    constructor() ERC20 ("Chita", "CHT", 10000000 * 1e8, 8)
    {
        _balance[_msgSender()] = 10000000 * 1e8;
    }



}