#!/bin/bash

set -e

SCENARIO=${1:-EulerSwapBasic}


function cleanup {
    pkill -P $$
}

trap cleanup EXIT


PORT=${PORT:-8545}
anvil --port $PORT --code-size-limit 100000 --gas-limit 30000000 --fork-url https://rpc.hyperliquid-testnet.xyz/evm &
sleep 1


RPC_URL=http://127.0.0.1:$PORT bash ./deploy-scenario.sh "$SCENARIO"


echo -------------------------------
echo DEVLAND READY
echo SCENARIO = $SCENARIO
echo -------------------------------

wait
