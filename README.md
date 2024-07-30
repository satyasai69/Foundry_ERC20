# OurToken - ERC20 Token

This project implements a simple ERC20 token named "OurToken" using OpenZeppelin contracts and Foundry for deployment and testing.

## Overview

OurToken is a standard ERC20 token built on the Ethereum blockchain. It uses OpenZeppelin's battle-tested ERC20 implementation for security and reliability. The project is set up with Foundry for efficient testing and deployment.

## Features

- Standard ERC20 functionality
- Customizable initial supply
- Comprehensive test suite using Foundry

## Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation.html)
- [Solidity](https://docs.soliditylang.org/en/v0.8.19/)

## Installation

1. Clone the repository:

```
 git clone https://github.com/satyasai69/Foundry_ERC20.git
 cd Foundry_ERC20
```

2. Install dependencies:

   ```
   forge install OpenZeppelin/openzeppelin-contracts@v5.0.2 --no-commit
   ```

## Contract

The main contract is `OurToken.sol`:

```solidity
//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract OurToken is ERC20 {
 constructor(uint256 initialSupply) ERC20("OurToken", "OT") {
     _mint(msg.sender, initialSupply);
 }
}

```

Testing
Tests are written using Foundry and can be found in test/OurTokenTest.t.sol. To run the tests:

```
forge test
```

The test suite covers:

Initial supply
Token name and symbol
Transfer functionality
Approval and transferFrom mechanisms
Failure cases for insufficient balance and allowance

Deployment
To deploy the contract using Foundry:

Set up your environment variables:

RPC_URL=your_rpc_url
PRIVATE_KEY=your_private_key

Run the deployment script:

```
forge script script/DeployOurToken.s.sol:DeployOurToken --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
```

Contributing
Contributions are welcome! Please feel free to submit a Pull Request.
License
This project is licensed under the MIT License - see the LICENSE file for details.
Acknowledgments

OpenZeppelin for their robust smart contract library
Foundry for their powerful Ethereum development tools

Copy
This README provides an overview of the project, instructions for installation and testing, a brief explanation of the contract, deployment instructions, and sections for contributing and licensing. You may want to adjust some details, such as the GitHub repository URL, to match your specific project setup.

Would you like me to elaborate on any part of this README or add any additional sections?
