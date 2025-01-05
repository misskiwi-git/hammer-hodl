// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract HammerHodl {

  address public owner;
  uint256 public withdrawalStartTime;

  event Deposit(address indexed sender, uint256 amount);
  event Withdrawal(address indexed recipient, uint256 amount);

  constructor(uint256 _withdrawalStartTime) {
    owner = msg.sender;
    withdrawalStartTime = _withdrawalStartTime;
  }

  // Function to receive ETH
  receive() external payable {
    require(msg.value > 0, "Must send ETH to deposit");
    emit Deposit(msg.sender, msg.value);
  }

  // Withdraw function (only allowed after withdrawalStartTime)
  function withdraw(uint256 amount) external {
    require(block.timestamp >= withdrawalStartTime, "Withdrawals not allowed yet");
    require(msg.sender == owner, "Only the designated address can withdraw");
    require(address(this).balance >= amount, "Insufficient contract balance");

    (bool success, ) = owner.call{value: amount}("");
    require(success, "Withdrawal failed");

    emit Withdrawal(owner, amount);
  }

  // Fallback function to handle unexpected ETH transfers
  fallback() external payable {
    emit Deposit(msg.sender, msg.value);
  }
}