// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AuthenticityContract {
    address public owner;

    enum CheckpointStatus { Authorized, Unauthorized }

    struct Checkpoint {
        address checkpointAddress;
        string checkpointName;
        CheckpointStatus status;
    }

    mapping(uint256 => Checkpoint[]) public goodsCheckpoints;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can do this.");
        _;
    }

    function addCheckpoint(uint256 _productId, address _checkpointAddress, string memory _checkpointName) public onlyOwner {
        goodsCheckpoints[_productId].push(Checkpoint(_checkpointAddress, _checkpointName, CheckpointStatus.Authorized));
    }

    function verifyAuthenticity(uint256 _productId, address _checkpointAddress) public view returns (bool) {
        for (uint256 i = 0; i < goodsCheckpoints[_productId].length; i++) {
            if (goodsCheckpoints[_productId][i].checkpointAddress == _checkpointAddress &&
                goodsCheckpoints[_productId][i].status == CheckpointStatus.Authorized) {
                return true;
            }
        }
        return false;
    }

    function getAuthorizedCheckpoints(uint256 _productId) public view returns (Checkpoint[] memory) {
        return goodsCheckpoints[_productId];
    }
}
