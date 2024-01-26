// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.13;

import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract Staking {
    /*//////////////////////////////////////////////////////////////
                                 STRUCTS
    //////////////////////////////////////////////////////////////*/

    struct Stake {
        uint256 lastStakePoints;
        uint256 lastStakeTime;
        uint256 stakeAmount;
    }

    /*//////////////////////////////////////////////////////////////
                                STORAGE
    //////////////////////////////////////////////////////////////*/

    IERC20 private immutable token;

    mapping(address => Stake) getStake;

    /*//////////////////////////////////////////////////////////////
                               CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    constructor(address _token) {
        token = ERC20(_token);
    }

    /*//////////////////////////////////////////////////////////////
                                 LOGIC
    //////////////////////////////////////////////////////////////*/

    function stake(uint256 amount) public {
        // stake logic
    }

    function unstake(uint256 amount) public {
        // unstake logic
    }

    function getPoints(uint256 amount) public {
        // get points logic
    }
}
