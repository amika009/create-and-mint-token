// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ShoppingToken is ERC20, Ownable {
    // Constructor to initialize the token with a name, symbol, and initial supply
    constructor() ERC20("ShoppingToken", "SHO") Ownable(msg.sender) {
        _mint(msg.sender, 1000 * 10**18);  // Mint 1000 tokens to the contract deployer
    }
    // Function to mint new tokens, callable only by the owner
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Function to burn tokens from the caller's address
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
