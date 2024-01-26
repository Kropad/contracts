// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.13;

import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    /*//////////////////////////////////////////////////////////////
                               CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    constructor() ERC20("TestToken", "TEST") {
        uint256 supply = 1_000_000 * 10 ** decimals();
        _mint(msg.sender, supply);
    }
}
