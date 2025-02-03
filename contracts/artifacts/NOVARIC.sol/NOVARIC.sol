// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/releases/download/v5.0.1/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/releases/download/v5.0.1/contracts/token/ERC20/extensions/ERC20FlashMint.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/releases/download/v5.0.1/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/releases/download/v5.0.1/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/releases/download/v5.0.1/contracts/token/ERC20/extensions/ERC20Votes.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/releases/download/v5.0.1/contracts/access/Ownable.sol";

/// @custom:security-contact security@novaric.co
contract NOVARIC is ERC20, ERC20Pausable, Ownable, ERC20Permit, ERC20Votes, ERC20FlashMint {
    constructor(address initialOwner)
        ERC20("NOVARIC", "NVX")
        Ownable(initialOwner)
        ERC20Permit("NOVARIC")
    {
        _mint(msg.sender, 2612 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Pausable, ERC20Votes)
    {
        super._update(from, to, value);
    }

    function _getVotingUnits(address account) internal view override returns (uint256) {
        return balanceOf(account);
    }
}
