pragma solidity ^0.5.11;

contract Inferno {

    string public tokenName;
    string public symbol;
    uint public decimals;
    uint public totalsupply;

    mapping (address => uint) internal balances;
    event Transfer( address _receiver, uint _value);

    constructor() public {
        tokenName = "Inferno Smart Token";
        symbol = "IST";
        decimals = 18;
        totalsupply = 10000000;
    }

    function name() public view returns ( string memory) {
        return tokenName;
    }

    function getsymbol() public view returns (string memory){
        return symbol;
    }

    function totalSupply() public view returns (uint ){
        return totalsupply;
    }

    function balanceOf(address _address) external view returns (uint) {
         return balances[_address];   
    }

    function transfer(address _receiver , uint _value) external {
         uint _owner_balance = balances[msg.sender];
         require(_owner_balance > 0 , "Insufficient Fund");
         require(_owner_balance >= _value,"Insufficient Balance to run this transaction on ether Network" );
         _owner_balance -= _value;
         balances[_receiver] += _value;
         emit Transfer( _receiver , _value);
    }


}