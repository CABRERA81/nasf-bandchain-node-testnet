#!/bin/bash

set -e  # ⚠️ Detener si hay errores

# 🚀 Clona el repositorio de BandChain
cd ~
git clone https://github.com/bandprotocol/chain
cd chain
git checkout v2.3.6

# 🔨 Compila e instala el binario
make install

# ✅ Verifica la instalación
bandd version

