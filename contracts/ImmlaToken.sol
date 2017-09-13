pragma solidity ^0.4.15;

import "./SafeMath.sol";
import "./StandardToken.sol";

contract ImmlaToken is StandardToken, SafeMath {
    /*
     * Token meta data
     */
    string public constant name = "IMMLA";
    string public constant symbol = "IML";
    uint public constant decimals = 18;
    uint public constant supplyLimit = 550688955000000000000000000;
    
    address public icoContract = 0x0;
    /*
     * Modifiers
     */
    
    modifier onlyIcoContract() {
        // only ICO contract is allowed to proceed
        require(msg.sender == icoContract);
        _;
    }
    
    /*
     * Contract functions
     */
    
    /// @dev Contract is needed in icoContract address
    /// @param _icoContract Address of account which will be mint tokens
    function ImmlaToken(address _icoContract) {
        assert(_icoContract != 0x0);
        icoContract = _icoContract;
    }
    
    /// @dev Burns tokens from address. It's can be applied by account with address this.icoContract
    /// @param _from Address of account, from which will be burned tokens
    /// @param _value Amount of tokens, that will be burned
    function burnTokens(address _from, uint _value) onlyIcoContract {
        assert(_from != 0x0);
        require(_value > 0);
        
        balances[_from] = sub(balances[_from], _value);
    }
    
    /// @dev Adds tokens to address. It's can be applied by account with address this.icoContract
    /// @param _to Address of account to which the tokens will pass
    /// @param _value Amount of tokens
    function emitTokens(address _to, uint _value) onlyIcoContract {
        assert(_to != 0x0);
        require(_value > 0);
        
        balances[_to] = add(balances[_to], _value);
    }
}