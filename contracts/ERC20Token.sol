// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract ERC20Token is IERC20 {
    uint256 private constant MAX_UINT256 = 2 ** 256 - 1;
    uint256 public totSupply;
    string public name; // Descriptive name (i.e. For Dummies Sample Token)
    uint8 public decimals; // How many decimals to use when displaying amounts
    string public symbol; // Short identifier for token (i.e. FDT)

    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowed;

    constructor(
        uint256 _initialAmount,
        string memory _tokenName,
        uint8 _decimalUnits,
        string memory _tokenSymbol
    ) {
        balances[msg.sender] = _initialAmount;
        totSupply = _initialAmount;
        name = _tokenName;
        decimals = _decimalUnits;
        symbol = _tokenSymbol;
    }

    function totalSupply() external view override returns (uint256) {
        return totSupply;
    }

    function balanceOf(
        address _account
    ) external view override returns (uint256) {
        return balances[_account];
    }

    function transfer(
        address _to,
        uint256 _amount
    ) external override returns (bool) {
        require(
            balances[msg.sender] >= _amount,
            "Insufficient funds for transfer source."
        );
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
        emit Transfer(msg.sender, _to, _amount); //solhint-disable-line indent, no-unused-vars
        return true;
    }

    function allowance(
        address _owner,
        address _spender
    ) external view override returns (uint256) {
        return allowed[_owner][_spender];
    }

    function approve(
        address _spender,
        uint256 _amount
    ) external override returns (bool) {
        allowed[msg.sender][_spender] = _amount;
        emit Approval(msg.sender, _spender, _amount);
        return true;
    }

    function transferFrom(
        address _from,
        address _to,
        uint256 _amount
    ) external override returns (bool) {
        uint256 allowance = allowed[_from][msg.sender];
        require(
            balances[_from] >= _amount && allowance >= _amount,
            "Insufficient allowed funds for transfer source."
        );
        balances[_to] += _amount;
        balances[_from] -= _amount;
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _amount;
        }
        emit Transfer(_from, _to, _amount);
        return true;
    }
}
