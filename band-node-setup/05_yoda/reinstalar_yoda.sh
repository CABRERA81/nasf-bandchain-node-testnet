#!/bin/bash

# Reinstala la herramienta Yoda desde cero.
# Uso: bash reinstalar_yoda.sh

set -e

# Cargar variables de entorno
source ~/band-node-setup/01_env/env.sh

echo "🧹 Eliminando instalación previa de Yoda..."
rm -f ~/go/bin/yoda
rm -rf ~/bandchain

echo "⬇️ Clonando repositorio oficial de BandChain..."
cd ~
git clone https://github.com/bandprotocol/chain bandchain
cd bandchain

echo "📌 Usando versión estable v2.4.1..."
git checkout v2.4.1

echo "🔨 Compilando Yoda..."
make yoda

echo "🚀 Instalando Yoda en ~/go/bin..."
cp build/yoda/yoda ~/go/bin/yoda

echo "✅ Yoda reinstalado correctamente:"
~/go/bin/yoda version
