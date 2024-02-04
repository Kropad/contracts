// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.13;

import {IERC20} from "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract Staking {
    struct Stake {
        uint256 lastStakePoints;
        uint256 lastStakeTime;
        uint256 stakeAmount;
        uint256 stakeTime;
    }

    Stake private _stake;

    IERC20 private immutable token;

    mapping(address => Stake) getStake;

    constructor(address _token) {
        token = ERC20(_token);
    }

    function stake(uint256 amount) public {
        uint tokenBalance = token.balanceOf(msg.sender);
        require(tokenBalance >= amount, "insufficient funds");

        _stake = getStake[msg.sender];

        bool success = token.transferFrom(msg.sender, address(this), amount);

        if (success) {
            if (_stake.stakeAmount == 0) {
                _stake.stakeTime = block.timestamp;
                _stake.stakeAmount = amount;
            } else {
                _stake.lastStakePoints +=
                    _stake.stakeAmount *
                    _stake._stake.stakeAmount += amount;
                _stake.LastStakeTime = block.timestamp;
            }
        } else {
            revert("Staking Failed");
        }
    }

    function unstake(uint256 amount) public {
        require(token.balanceOf(msg.sender) >= amount, "insufficient funds");
        token.transferFrom(address(this), msg.sender, amount);
        _stake = getStake[msg.sender];
        _stake.stakeAmount -= amount;
    }

    function points(address address_) external view returns (uint) {
        return _points(address_);
    }

    function _points(address address_) internal view returns (uint) {
        return
            (block.timestamp - lastStakeTime[address_]) * balanceOf[address_];
    }

    /* */
    function getPoints(uint256 amount) public {
        // get points logic
    }
}
