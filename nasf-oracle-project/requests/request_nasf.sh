#!/bin/bash

# Variables
ORACLE_SCRIPT_ID=XX   # ← Cambia esto por el ID real de tu NASF Oracle Script
ASK_COUNT=4
MIN_COUNT=3
FEES="500uband"
CHAIN_ID="laozi-testnet"
FROM="keplr_wallet"
GAS_ADJUSTMENT="1.5"

# Lanzar solicitud
bandd tx oracle request-data \
  $ORACLE_SCRIPT_ID \
  "NASF" \
  --ask-count $ASK_COUNT \
  --min-count $MIN_COUNT \
  --fee-limit 100000uband \
  --prepare-gas 50000 \
  --execute-gas 200000 \
  --from $FROM \
  --chain-id $CHAIN_ID \
  --gas auto \
  --gas-adjustment $GAS_ADJUSTMENT \
  --fees $FEES \
  -y
