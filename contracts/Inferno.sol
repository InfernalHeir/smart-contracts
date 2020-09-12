pragma solidity ^0.5.11;

contract Inferno {
    string public tokenName;
    string public symbols;
    uint256 public decimals;
    uint256 public totalsupply;

    mapping(address => uint256) internal balances;
    event Transfer(address _receiver, uint256 _value);

    constructor() public {
        tokenName = "Inferno Smart Token";
        symbols = "IST";
        decimal = 18;
        totalsupply = 10000000;
    }

    function name() external view returns (string memory) {
        return tokenName;
    }

    function symbol() external view returns (string memory) {
        return symbols;
    }

    function decimals() external view returns ( string memory) {
        return decimal;
    }

    function totalSupply() external view returns (uint256) {
        return totalsupply;
    }

    function balanceOf(address _address) external view returns (uint256) {
        return balances[_address];
    }
    function transfer(address _receiver, uint256 _value) external {
        uint256 _owner_balance = balances[msg.sender];
        require(_owner_balance > 0, "Insufficient Fund");
        require(
            _owner_balance >= _value,
            "Insufficient Balance to run this transaction on ether Network"
        );
        _owner_balance -= _value;
        balances[_receiver] += _value;
        emit Transfer(_receiver, _value);
    }
}
