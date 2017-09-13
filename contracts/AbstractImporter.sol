pragma solidity ^0.4.15;

import "./ImmlaIco.sol";

// Abstract balances importer from pre-ICO to ICO
contract AbstractImporter {
    address public owner;
    ImmlaIco public ico;
    
    /// @dev Importer contructor
    function AbstractImporter() {
        owner = msg.sender;
    }
    
    /// @dev Imports tokens from pre-ICO to ICO. Requires it was setted as importManager
    /// Can be called only by creator of contract
    /// @param _immlaIco Address of ICO
    function importTokens(address _immlaIco) {
        assert(owner == msg.sender);
        ico = ImmlaIco(_immlaIco);
        assert(ico.tokenImporter() == address(this));
        
        _import();
    }
    
    function _import() internal;
}