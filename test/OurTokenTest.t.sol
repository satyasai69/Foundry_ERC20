//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DepolyOurToken} from "script/DepolyOurToken.s.sol";
import {OurToken} from "src/OurToken.sol";

interface MintableToken {
    function mint(address, uint256) external;
}

contract OurTokenTest is Test {
    OurToken public ourToken;
    DepolyOurToken public depolyer;

    address Bob = makeAddr("bob");
    address Alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        depolyer = new DepolyOurToken();
        ourToken = depolyer.run();

        vm.prank(msg.sender);

        ourToken.transfer(Bob, STARTING_BALANCE);
    }

    function testStartingBalance() public view {
        assertEq(STARTING_BALANCE, ourToken.balanceOf(Bob));
    }

    function testAllowancesWorks() public {
        uint256 allowanceAmount = 100000;

        vm.prank(Bob);
        ourToken.approve(Alice, allowanceAmount);

        vm.prank(Alice);
        ourToken.transferFrom(Bob, Alice, allowanceAmount);

        assertEq(ourToken.balanceOf(Alice), allowanceAmount);
        assertEq(ourToken.balanceOf(Bob), STARTING_BALANCE - allowanceAmount);
    }

    function testUserCanMint() public {
        uint256 MINT_AMOUNT = 100000 ether;
        vm.prank(Bob);

        // ourToken._mint(address(Bob), MINT_AMOUNT);
        vm.expectRevert();
        MintableToken(address(ourToken)).mint(Bob, MINT_AMOUNT);
    }

    function testUserCanTransferToken() public {
        uint256 TRANSFER_AMOUNT = 10 ether;

        vm.prank(Bob);
        ourToken.transfer(Alice, TRANSFER_AMOUNT);

        assertEq(ourToken.balanceOf(Bob), STARTING_BALANCE - TRANSFER_AMOUNT);
        assertEq(ourToken.balanceOf(Alice), TRANSFER_AMOUNT);
    }

    function testFailTransferFromInsufficientAllowance() public {
        uint256 TRANSFER_AMOUNT = 10 ether;

        vm.prank(Alice);
        //  vm.expectRevert();
        ourToken.transfer(Bob, TRANSFER_AMOUNT);
    }

    function testTokenMetadata() public view {
        assertEq(ourToken.name(), "OurToken");
        assertEq(ourToken.symbol(), "OT");
        assertEq(ourToken.decimals(), 18);
    }
}
