// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract Wallet {
    address public owner;
    mapping(address => User) public users;

    struct User {
        address userAddress;
        uint256 allowance;
        uint256 validity;
    }

    event AllowanceRenewed(
        address indexed user,
        uint256 allowance,
        uint256 timeLimit
    );
    event CoinsSpent(address indexed receiver, uint256 amount);

    modifier onlyOwner() {
        msg.sender == owner;
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    receive() external payable onlyOwner {}

    function getWalletBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function renewAllowance(
        address _user,
        uint256 _allowance,
        uint256 _timeLimit
    ) public onlyOwner {
        uint256 validity = block.timestamp + _timeLimit;
        users[_user] = User(_user, _allowance, validity);
        emit AllowanceRenewed(_user, _allowance, _timeLimit);
    }

    function myAllowance() public view returns (uint256) {
        return users[msg.sender].allowance;
    }

    function spendCoins(address payable _receiver, uint256 _amount) public {
        User storage user = users[msg.sender];
        require(block.timestamp < user.validity, "Validity expired!!");
        require(_amount <= user.allowance, "Allowance not sufficient!!");

        user.allowance -= _amount;
        _receiver.transfer(_amount);
        emit CoinsSpent(_receiver, _amount);
    }
}
