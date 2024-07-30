-include .env

.PHONY: all test depoly


build: ; forge build

test: ; forge test

anvil :; anvil -m 'test test test test test test test test test test test junk' --steps-tracing --block-time 1

depoly-anvil: ; forge script script/DepolyOurToken.s.sol:DepolyOurToken --rpc-url ${ANVIL_RPC_URL} --private-key ${ANVIL_PRIVATE_KEY} --broadcast