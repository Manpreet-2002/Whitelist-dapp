// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

contract Whitelist {
    uint8 public maxWhitelistedAddresses;

    constructor(uint8 _maxWhitelistedAddresses){
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    mapping(address => bool) public whitelistedAddress;
    
    uint8 public numAddressesWhitelisted;

    function addAddressToWhitelist() public {
        require(!whitelistedAddress[msg.sender], "Address already whitelisted");
        require(numAddressesWhitelisted<maxWhitelistedAddresses, "No more address can be whitelisted");
        whitelistedAddress[msg.sender] = true;
        numAddressesWhitelisted++;
    }
}