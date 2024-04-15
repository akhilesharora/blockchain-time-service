// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TimeCollector {
    event TimeRequested(address indexed sender, uint256 timestamp);
    IERC20 public usdc;

    uint256 public constant FEE = 10000; // 1 cent in USDC smallest units

    constructor(address _usdcAddress) {
        usdc = IERC20(_usdcAddress);
    }

    function collectTime() public {
        require(usdc.transferFrom(msg.sender, address(this), FEE), "Failed to collect USDC fee");
        emit TimeRequested(msg.sender, block.timestamp);
    }
}

