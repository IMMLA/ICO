pragma solidity ^0.4.15;

import "./ImmlaIco.sol";

contract ReturnManager {
    ImmlaIco public ico;
    address public owner;
    
    modifier onlyOwner {
        assert(msg.sender == owner);
        _;
    }

    function ReturnManager(address _ico) public {
        ico = ImmlaIco(_ico);
        owner = msg.sender;
    }
    
    function resetManager() public onlyOwner {
        ico.setNewManager(owner);
    }
    
    function returnFor(address[] _accounts) public {
        for (uint i = 0; i < _accounts.length; i++) {
            ico.returnFundsFor(_accounts[i]);
        }
    }
}