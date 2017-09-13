pragma solidity ^0.4.15;

// only for tests
contract PreIcoContract {
    mapping (address => uint) balances;
    
    function balanceOf(address _account) constant returns(uint256 balance) {
       return balances[_account]; 
    }
    
    function PreIcoContract(address _acc1, uint _value1, address _acc2, uint _value2) {
        balances[_acc1] = _value1;
        balances[_acc2] = _value2;
    }
}