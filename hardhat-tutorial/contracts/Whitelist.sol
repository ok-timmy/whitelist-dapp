//SPDX-Licenste-Identifier : MIT
pragma solidity ^0.8.0;

contract Whitelist {

    //Maximum number of whitelisted Addresses
    uint public maxWhitelistedAddresses;

    //Keeps track of the number of the number of whitelisted addresses
    uint public numAddressesWhitelisted;

    //Keeps track of whether an address has been whitelisted or not.
    mapping (address => bool) public whitelistedAddresses;
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }


    function addAddressToWhitelist() public {
        //Check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        //Check if the number of whitelisted addresses is still less than the maximum number of whitelisted addresses
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "Whitelist Limit reached already. No more addresses can be whitelisted");


        // If all these conditions are met, add the address which called the function to the whitelist.
        whitelistedAddresses[msg.sender] = true;

        numAddressesWhitelisted++;
    }

    function checkIfWhitelisted() public view returns (bool yes) {
        if (whitelistedAddresses[msg.sender] == true) {
            return true;
        } else return false;
    }

}