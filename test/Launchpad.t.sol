// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Launchpad} from "../src/Launchpad.sol";
import {Staking} from "../src/Staking.sol";
import {Token} from "../src/Token.sol";

contract LaunchpadTest is Test {
    Launchpad public launchpad;
    Staking public staking;
    Token public token;

    function setUp() public {
        uint256 _entryPrice = 45 * 10 ** 18;

        token = new Token();
        staking = new Staking(address(token));
        launchpad = new Launchpad(
            address(staking),
            address(token),
            _entryPrice
        );
    }

    function test_Todo() public {
        assertEq(2, 1);
    }
}
