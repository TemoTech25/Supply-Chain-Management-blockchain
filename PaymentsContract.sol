// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SupplyChainContract {
    address public owner;

    enum Role { Manufacturer, Distributor, Retailer, Customer }

    struct Stakeholder {
        address stakeholderAddress;
        Role role;
        uint256 balance;
    }

    mapping(address => Stakeholder) public stakeholders;

    event PaymentReceived(address indexed from, uint256 amount);
    event PaymentSent(address indexed to, uint256 amount);

    constructor() {
        owner = msg.sender;
        stakeholders[owner] = Stakeholder(owner, Role.Manufacturer, 0);
    }

    modifier onlyStakeholder(Role _role) {
        require(stakeholders[msg.sender].role == _role, "Only authorized stakeholders can do this.");
        _;
    }

    function addStakeholder(address _stakeholderAddress, Role _role) public onlyStakeholder(Role.Manufacturer) {
        stakeholders[_stakeholderAddress] = Stakeholder(_stakeholderAddress, _role, 0);
    }

    function deposit() public payable {
        stakeholders[msg.sender].balance += msg.value;
        emit PaymentReceived(msg.sender, msg.value);
    }

    function sendPayment(address payable _recipient, uint256 _amount) public onlyStakeholder(Role.Manufacturer) {
        require(stakeholders[msg.sender].balance >= _amount, "Insufficient balance.");
        stakeholders[msg.sender].balance -= _amount;
        _recipient.transfer(_amount);
        emit PaymentSent(_recipient, _amount);
    }

    function getBalance(address _stakeholderAddress) public view returns (uint256) {
        return stakeholders[_stakeholderAddress].balance;
    }
}
