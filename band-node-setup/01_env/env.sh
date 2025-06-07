#!/bin/bash

# 🔗 Chain ID de la testnet Laozi #6
export CHAIN_ID="band-laozi-testnet6"

# 🧾 Nombre de la wallet (reemplaza con el tuyo, sin espacios)
export WALLET_NAME="nashvalidador"

# 🎙 Nombre del nodo validador (puede ser tu nombre o alias)
export MONIKER="nash-node"

# 🔌 Nodos seeds de conexión P2P
export SEEDS="da61931cbbbb2b62dbe7c470d049126cf365d257@35.213.165.61:26656,fffd730672f04d5dc065fa9afce2eb1d6bc4d150@35.212.60.28:26656"

# 🧬 URL del archivo génesis
export GENESIS_FILE_URL="https://raw.githubusercontent.com/bandprotocol/launch/master/band-laozi-testnet6/genesis.json"

# 📦 Archivos de scripts/oráculos para testnet
export BIN_FILES_URL="https://raw.githubusercontent.com/bandprotocol/launch/master/band-laozi-testnet6/files.tar.gz"

# 🚰 Faucet para obtener tokens de prueba
export FAUCET_URL="https://laozi-testnet6.bandchain.org/faucet"

# ⚙️ Cosmovisor config
export DAEMON_NAME="bandd"
export DAEMON_HOME="$HOME/.band"

# 🚀 URL de tu executor en AWS Lambda (ya en producción)
export EXECUTOR_URL="https://7toi554gy3.execute-api.us-east-2.amazonaws.com/prod/executor"

# 🛣 Agrega Go a tu PATH
export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin

