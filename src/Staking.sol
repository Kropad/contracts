// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.13;

import {Token} from "./Token.sol";

contract Staking {
    /*//////////////////////////////////////////////////////////////
                                 STRUCTS
    //////////////////////////////////////////////////////////////*/

    struct Stake {
        uint256 snapshotPoints;
        uint256 snapshotTimestamp;
        uint256 amount;
    }

    /*//////////////////////////////////////////////////////////////
                                STORAGE
    //////////////////////////////////////////////////////////////*/

    Token private immutable token;

    mapping(address => Stake) getStake;

    /*//////////////////////////////////////////////////////////////
                               CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    constructor(address _token) {
        token = Token(_token);
    }

    /*//////////////////////////////////////////////////////////////
                                 LOGIC
    //////////////////////////////////////////////////////////////*/

    function stake(uint256 amount) public {
        bool success = token.transferFrom(msg.sender, address(this), amount);
        require(success, "transfer didn't succeed");

        Stake storage _stake = getStake[msg.sender];

        if (_stake.snapshotTimestamp != 0) {
            _stake.snapshotPoints +=
                (block.timestamp - _stake.snapshotTimestamp) *
                _stake.amount;
        }

        _stake.amount += amount;
        _stake.snapshotTimestamp = block.timestamp;
    }

    function unstake() external {
        Stake storage _stake = getStake[msg.sender];

        require(_stake.amount > 0, "no _stake amount");

        bool success = token.transfer(msg.sender, _stake.amount);
        require(success, "transfer didn't succeed");

        _stake.snapshotPoints = 0;
        _stake.snapshotTimestamp = 0;
        _stake.amount = 0;
    }

    function calculatePoints(address addr) public view returns (uint256) {
        Stake storage _stake = getStake[addr];

        return
            _stake.snapshotPoints +
            (block.timestamp - _stake.snapshotTimestamp) *
            _stake.amount;
    }
}
