#!/bin/bash

set -e

# ⚙️ Cargar variables
source ~/band-node-setup/01_env/env.sh

echo "🧹 Borrando configuración vieja de Yoda (si existe)..."
rm -rf ~/.yoda

echo "⚙️ Configurando Yoda..."
yoda config chain-id band-laozi-testnet6
yoda config node http://localhost:26657
yoda config broadcast-timeout "5m"
yoda config rpc-poll-interval "1s"
yoda config max-try 5

echo "🔗 Asociando el validador..."
yoda config validator $(bandd keys show $WALLET_NAME -a --bech val --keyring-backend test)

echo "👥 Añadiendo cuentas reporteras..."
for i in {1..5}; do
  yoda keys add REPORTER_$i --keyring-backend test
done

echo "🌐 Configurando executor remoto..."
EXECUTOR_URL="https://7toi554gy3.execute-api.us-east-2.amazonaws.com/prod/executor"
yoda config executor "rest:${EXECUTOR_URL}?timeout=10s"

echo "✅ Yoda configurado correctamente."

