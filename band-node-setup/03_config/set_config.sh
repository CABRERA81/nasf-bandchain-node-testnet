#!/bin/bash

set -e

# ⚙️ Cargar variables de entorno
source ~/band-node-setup/01_env/env.sh

# 🧩 Agrega los SEEDS al archivo config.toml
sed -E -i "s/^seeds *=.*/seeds = \"$SEEDS\"/" $HOME/.band/config/config.toml

# ⛽ Configura el mínimo gas price en app.toml
sed -E -i "s/^minimum-gas-prices *=.*/minimum-gas-prices = \"0.0025uband\"/" $HOME/.band/config/app.toml

echo "✅ Seeds y gas mínimo configurados correctamente"

