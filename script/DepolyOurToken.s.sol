//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {OurToken} from "src/OurToken.sol";

contract DepolyOurToken is Script {
    uint256 public constant INITAL_SUPPLT = 1000 ether;

    function run() external returns (OurToken) {
        vm.startBroadcast();
        OurToken ourToken = new OurToken(INITAL_SUPPLT);
        vm.stopBroadcast();

        return ourToken;
    }
}
