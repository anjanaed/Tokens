//SPDX-License-Identifier: MIT

pragma solidity ^0.8.3;

interface ERC20Interface {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256 balance);
    function allowance(
        address owner,
        address spender
    ) external returns (uint256 remaining);
    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool success);
    function approve(
        address spender,
        uint256 amount
    ) external returns (bool success);
    function transferFrom(
        address sender,
        address receiver,
        uint256 amount
    ) external returns (bool success);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

contract MoraToken is ERC20Interface {
    string public symbol;
    string public name;
    uint8 public decimals;
    uint256 public _totalSupply;

    mapping(address => uint256) balance;
    mapping(address => mapping(address => uint)) allowed;

    constructor() {
        symbol = "Anji";
        name = "UOM Token";
        decimals = 18;
        _totalSupply = 1_000_001_000_000_000_000_000_000;
        balance[0x31D4b0868F4e49EB829f16eC3C267008808A38d6] = _totalSupply - 69* 10**18;
        balance[0xbEC83E49424a2b441C2bFf52c1a854BcB897B3ce] = 69* 10**18;
        emit Transfer(
            address(0),
            0x31D4b0868F4e49EB829f16eC3C267008808A38d6,
            _totalSupply - 69
        );
        emit Transfer(
            address(1),
            0xbEC83E49424a2b441C2bFf52c1a854BcB897B3ce,
            69
        );
    }

    function totalSupply() public view returns (uint256) {
        return
            _totalSupply - balance[0x000000000000000000000000000000000000dEaD];
    }

    function balanceOf(address account) public view returns (uint256 balances) {
        return balance[account];
    }

    function transfer(
        address recipient,
        uint256 amount
    ) public returns (bool success) {
        balance[msg.sender] = balance[msg.sender] - amount;
        balance[recipient] = balance[recipient] + amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function approve(
        address spender,
        uint256 amount
    ) public returns (bool success) {
        allowed[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(
        address sender,
        address receiver,
        uint256 amount
    ) public returns (bool success) {
        balance[msg.sender] = balance[msg.sender] - amount;
        allowed[sender][msg.sender] = allowed[sender][msg.sender] - amount;
        balance[receiver] = balance[receiver] + amount;
        emit Transfer(sender, receiver, amount);
        return true;
    }

    function allowance(
        address owner,
        address spender
    ) public view returns (uint256 remaining) {
        return allowed[owner][spender];
    }
}
