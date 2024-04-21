// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

interface IAlienSpaceship {
    function missionAborted() external view returns (bool);

    function abortMission() external;

    function applyForJob(bytes32) external;

    function applyForPromotion(bytes32) external;

    function roles(address) external view returns (uint256, uint256, bool);

    function CAPTAIN() external view returns (uint256);

    function PHYSICIST() external view returns (uint256);

    function ENGINEER() external view returns (uint256);

    function BLOCKCHAIN_SECURITY_RESEARCHER() external view returns (uint256);

    function enableWormholes() external;

    function quitJob() external;

    function runExperiment(bytes memory) external;

    function jumpThroughWormhole(
        int256,
        int256,
        int256
    ) external returns (string memory);

    function dumpPayload(uint256) external;

    function payloadMass() external returns (uint256);

    function visitArea51(address) external;
}
