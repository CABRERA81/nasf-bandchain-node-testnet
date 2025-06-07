#!/bin/bash

set -e

# ⚙️ Cargar variables de entorno
source ~/band-node-setup/01_env/env.sh

# 🧱 Instalar Cosmovisor
go install github.com/cosmos/cosmos-sdk/cosmovisor/cmd/cosmovisor@v1.0.0

# 📁 Crear estructura de carpetas
mkdir -p $DAEMON_HOME/cosmovisor/genesis/bin
mkdir -p $DAEMON_HOME/cosmovisor/upgrades

# 📦 Copiar el binario bandd al folder de genesis
cp ~/go/bin/bandd $DAEMON_HOME/cosmovisor/genesis/bin/

# ✅ Verificar instalación
echo "Cosmovisor instalado en: $(which cosmovisor)"
