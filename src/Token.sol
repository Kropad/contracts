// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    constructor() ERC20("TestToken", "TEST") {
        uint256 supply = 1_000_000_000;
        _mint(msg.sender, supply);
    }
}
