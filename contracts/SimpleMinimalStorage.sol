// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SimpleStorage {
    uint256 public number;

    function set(uint256 _num) public {
        number = _num;
    }

    function get() public view returns (uint256) {
        return number;
    }
}
