#!/bin/bash

set -e

# ⚙️ Cargar variables
source ~/band-node-setup/01_env/env.sh

# 👤 Obtener nombre de usuario actual
USERNAME=$(whoami)

# ��️ Crear archivo bandd.service con Cosmovisor
sudo tee /etc/systemd/system/bandd.service > /dev/null <<EOF
[Unit]
Description=BandChain Node Daemon (Cosmovisor)
After=network-online.target

[Service]
User=$USERNAME
ExecStart=$HOME/go/bin/cosmovisor start
Restart=always
RestartSec=3
LimitNOFILE=4096
Environment="DAEMON_NAME=bandd"
Environment="DAEMON_HOME=$HOME/.band"
Environment="DAEMON_RESTART_AFTER_UPGRADE=true"
Environment="DAEMON_ALLOW_DOWNLOAD_BINARIES=false"
Environment="UNSAFE_SKIP_BACKUP=true"

[Install]
WantedBy=multi-user.target
EOF

echo "✅ Servicio bandd.service creado en /etc/systemd/system"

