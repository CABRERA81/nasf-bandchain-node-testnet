#!/bin/bash

set -e

# ⚙️ Cargar variables de entorno
source ~/band-node-setup/01_env/env.sh

echo "🚮 Eliminando versiones anteriores de Go..."
sudo rm -rf /usr/local/go
rm -rf ~/go

echo "⬇️ Instalando Go 1.19.1..."
cd ~
wget https://go.dev/dl/go1.19.1.linux-amd64.tar.gz
tar -xvf go1.19.1.linux-amd64.tar.gz
sudo mv go /usr/local/go
source ~/.profile

echo "✅ Go instalado: $(go version)"

echo "🛠️ Reinstalando Cosmovisor..."
go install github.com/cosmos/cosmos-sdk/cosmovisor/cmd/cosmovisor@v1.0.0

echo "⬆️ Cambiando a BandChain v2.4.1..."
cd ~/chain
git fetch --all
git checkout v2.4.1
make install

echo "📁 Preparando carpeta de upgrade para Cosmovisor..."
mkdir -p $DAEMON_HOME/cosmovisor/upgrades/v2_4/bin
cp ~/go/bin/bandd $DAEMON_HOME/cosmovisor/upgrades/v2_4/bin/

echo "✅ Upgrade v2.4.1 listo para Cosmovisor."
