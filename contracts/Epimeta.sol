//SPDX-License-Identifier: Unlicense
pragma solidity 0.8.4;

import "hardhat/console.sol";

contract Epimeta {
    event showAdded(uint id);
    event showDeleted(uint id);

    mapping(address => mapping(uint => bool)) public shows; // EOA => show ID => following
    mapping(address => uint[]) public indices; // EOA => array of shows

    // add show
    function addShow(uint id) external {
        require(!shows[msg.sender][id], "Already following show");
        shows[msg.sender][id] = true;
        indices[msg.sender].push(id);
        emit showAdded(id);
        console.log("Following show", id);
    }

    // delete show
    function deleteShow(uint id) private {
        require(
            shows[msg.sender][id],
            "Cannot delete show that isn't followed"
        );
        shows[msg.sender][id];
        delete shows[msg.sender][id];
    }

    // get following shows (allows client to render EOA's shows)
    function getShows() external view returns (uint[] memory) {}
}
