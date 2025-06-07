#!/bin/bash

set -e

# ⚙️ Cargar variables de entorno
source ~/band-node-setup/01_env/env.sh

# 🧬 Inicializa el nodo con el moniker y el chain ID
bandd init "$MONIKER" --chain-id $CHAIN_ID

# �� Descarga el archivo génesis
wget $GENESIS_FILE_URL -O $HOME/.band/config/genesis.json

# 📦 Descarga los archivos de oráculo y descomprime
wget -qO- $BIN_FILES_URL | tar xvz -C $HOME/.band/

# 👛 Crea una wallet local
bandd keys add $WALLET_NAME --keyring-backend test
