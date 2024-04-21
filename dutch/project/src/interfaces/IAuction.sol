// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;
import {IWETH} from "src/interfaces/IWETH.sol";

interface IAuction {
    function buyWithPermit(
        address owner,
        address spender,
        uint256 value,
        uint256 deadline,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external;

    function getPrice() external view returns (uint256);

    function buy() external;

    function token() external view returns (IWETH);
}
