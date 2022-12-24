// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./IERC20.sol";
import "./SafeMath.sol";
import "./Context.sol";
import "./Ownable.sol";

contract ERC20 is IERC20 , Context , Ownable {
    using SafeMath for uint256;
    // contract
    // mapping token balance of an address
    mapping (address => uint256) _balance;
    // mapping allowance
    mapping (address => mapping (address => uint256)) _allowance;


    // uint
    uint private _totalSupply;
    uint private _decimals;

    //string
    string private _name;
    string private _symbol;

    // constructor
    constructor
    (
        string memory name_, 
        string memory symbol_ , 
        uint totalSupply_ , 
        uint decimals_
        ){
            _name = name_;
            _symbol = symbol_;
            _totalSupply = totalSupply_;
            _decimals = decimals_;
            }

    // function 
    // function name returns name of token
    function name() public view virtual returns(string memory){
        return _name;
    }

    // function symbol returns symbol of token
    function symbol () public view virtual returns(string memory) {
        return _symbol;
    }

    // function decimals returns decimals of token
    function decimals () public view virtual returns(uint256) {
        return _decimals;
    }

    // function totalSupply returns totalSupply of token
    function totalSupply () public view virtual override returns(uint256) {
        return _totalSupply;
    }


    // function balanceOf returns balanceof of token in an acoount address
    function balanceOf (address account) public view virtual override returns(uint256) {
        return _balance[account];
    }

    // function _transfer transfering a specific amount of token from an address to another one
    function _transfer (
        address from , 
        address to,
        uint256 amount
    ) internal virtual {
        require(from != address(0), "ERC20: from a zero address");
        require(to != address(0), "ERC20: to a zero address");

        uint256 _fromBalance = _balance[from];
        require(_fromBalance >= amount, "ERC20: insufficiant Balance");

        _balance[from] = _balance[from].sub(amount);
        _balance[to] = _balance[to].add(amount);

        // emit transfer
        emit Transfer(from, to, amount);
    }

    // function approval transfer
    function _approve (
        address owner, 
        address spender , 
        uint256 amount)
        internal virtual {
            require(owner != address(0), "ERC20: owner is a zero address");
            require(spender != address(0), "ERC20: spender is a zero address");
            
            _allowance[owner][spender] = amount;

            emit Approval(owner, spender, amount);
        }

    // function override

    // transfer function return bool
    function transfer (
        address to,
        uint256 amount
    ) public virtual override returns(bool){
        address from = _msgSender();
        _transfer(from, to, amount);
        return true;
    }

    // allowance function return amount 
    function allowance (
        address owner,
        address spender
    ) public view virtual override returns(uint256){
        return _allowance[owner][spender];
    }

    // approve function return bool
    function approve (
        address spender,
        uint256 amount
    ) public virtual override returns(bool){
        address owner = _msgSender();
        _approve(owner, spender, amount);
        return true;
    }

    // transferFrom function
    function transferFrom(
        address from, 
        address to, 
        uint256 amount
    ) public virtual override returns(bool){
        address spender = _msgSender();
        require(amount <= _allowance[from][spender],"ERC20: once transfer available");
        _allowance[from][spender]= _allowance[from][spender].sub(amount);
        _transfer(from, to, amount);
        return true;
    }

}