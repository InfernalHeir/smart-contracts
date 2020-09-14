pragma solidity ^0.5.11;

contract Inferno {
    string public tokenName;
    string public symbols;
    uint256 public decimal;
    uint256 public totalsupply;

    address public owner;

    mapping(address => uint256) internal balances;
    mapping (address => mapping(address => uint)) public _apporved;

    event Transfer(address indexed _to,address indexed _from, uint256 _value);
    event Approvel(address indexed _spender , address indexed _receiver, uint256 _value);

    constructor() public {
        tokenName = "Flame Network";
        symbols = "FLN";
        decimal = 18;
        totalsupply = 10000000;
        owner = msg.sender;
    }

    function name() external view returns (string memory) {
        return tokenName;
    }

    function symbol() external view returns (string memory) {
        return symbols;
    }

    function decimals() external view returns (uint) {
        return decimal;
    }

    function totalSupply() external view returns (uint256) {
        return totalsupply;
    }

    function balanceOf(address _address) external view returns (uint256) {
        return balances[_address];
    }

    function transfer(address _receiver, uint256 _value) external {
        uint256 balance = balances[owner];
        require(balance == 0, "Insufficient Fund");
        require( balance < _value,  "Insufficient Balance");
        balance -= _value;
        balances[_receiver] += _value;
        emit Transfer(owner,_receiver, _value);
    }

    function approve(address _receiver, uint _value) external returns (bool) {
        _apporved[owner][_receiver] = _value;
        emit Approvel(msg.sender , _receiver, _value);
        return true;
    }

    function allowance( address _owner , address _receiver) external view returns  (uint) {
        return _apporved[_owner][_receiver];
    }
   
}
