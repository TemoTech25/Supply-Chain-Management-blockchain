// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TrackingContract {
    address public owner;

    struct LocationUpdate {
        uint256 timestamp;
        string location;
    }

    mapping(uint256 => LocationUpdate[]) public goodsLocations;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can do this.");
        _;
    }

    function updateLocation(uint256 _productId, string memory _location) public onlyOwner {
        goodsLocations[_productId].push(LocationUpdate(block.timestamp, _location));
    }

    function getCurrentLocation(uint256 _productId) public view returns (string memory) {
        uint256 latestUpdateIndex = goodsLocations[_productId].length - 1;
        require(latestUpdateIndex >= 0, "No location updates available.");
        return goodsLocations[_productId][latestUpdateIndex].location;
    }
}