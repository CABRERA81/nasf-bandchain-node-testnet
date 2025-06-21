#!/bin/bash

set -e

# 🔧 Instala dependencias básicas (git, build-essential, wget, curl)
#    usando apt o yum según la distribución.
if command -v apt-get >/dev/null 2>&1; then
    echo "🔄 Actualizando paquetes..."
    sudo apt-get update
    echo "📦 Instalando paquetes esenciales..."
    sudo apt-get install -y git build-essential wget curl
elif command -v yum >/dev/null 2>&1; then
    echo "📦 Instalando paquetes esenciales..."
    sudo yum install -y git wget curl
    sudo yum groupinstall -y "Development Tools"
else
    echo "❌ Gestor de paquetes no soportado. Usa una distro con apt o yum." >&2
    exit 1
fi

# ⭐ Instalación de Go
GO_VERSION="1.19.1"

echo "👉 Descargando Go $GO_VERSION..."
wget https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz
rm go${GO_VERSION}.linux-amd64.tar.gz

echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
source ~/.profile

echo "✅ Dependencias instaladas correctamente."
