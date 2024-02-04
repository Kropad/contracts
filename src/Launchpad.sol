// SPDX-License-Identifier: AGPL-3.0
pragma solidity ^0.8.13;

import {Staking} from "./Staking.sol";
import {Token} from "./Token.sol";

contract Launchpad {
    /*//////////////////////////////////////////////////////////////
                                 STRUCTS
    //////////////////////////////////////////////////////////////*/

    struct Project {
        string name;
        string desc;
        string site;
        string dc;
        string tg;
        string x;
        address token;
        uint256 amount;
        uint256 price;
    }

    /*//////////////////////////////////////////////////////////////
                                STORAGE
    //////////////////////////////////////////////////////////////*/

    Staking private immutable staking;
    Token private immutable token;
    Project[] public projects;
    uint256 public entryFee;

    mapping(address => mapping(uint256 => bool)) isJoined;

    /*//////////////////////////////////////////////////////////////
                               CONSTRUCTOR
    //////////////////////////////////////////////////////////////*/

    constructor(address _staking, address _token, uint256 _entryFee) {
        staking = Staking(_staking);
        token = Token(_token);
        entryFee = _entryFee;
    }

    /*//////////////////////////////////////////////////////////////
                                 LOGIC
    //////////////////////////////////////////////////////////////*/

    function getProjects() external view returns (Project[] memory) {
        return projects;
    }

    function hasJoined(
        address _addr,
        uint256 _projectIndex
    ) external view returns (bool) {
        return isJoined[_addr][_projectIndex];
    }

    function listProject(
        string memory _name,
        string memory _desc,
        string memory _site,
        string memory _dc,
        string memory _tg,
        string memory _x,
        address _token,
        uint256 _amount,
        uint256 _price
    ) external {
        Project storage project;

        project.name = _name;
        project.desc = _desc;
        project.site = _site;
        project.dc = _dc;
        project.tg = _tg;
        project.x = _x;
        project.token = _token;
        project.amount = _amount;
        project.price = _price;

        // todo: list project logic

        projects.push(project);
    }

    function joinProject(uint256 _projectIndex) public {
        Project storage project = projects[_projectIndex];
        uint256 points = staking.calculatePoints(msg.sender);
        bool isAlreadyJoined = isJoined[msg.sender][_projectIndex];

        require(!isAlreadyJoined, "already joined this project");

        // todo: join project logic

        isJoined[msg.sender][_projectIndex] = true;
    }
}
