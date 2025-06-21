#!/bin/bash

set -e

USERNAME=$(whoami)

# ��️ Crear servicio systemd para Yoda
sudo tee /etc/systemd/system/yoda.service > /dev/null <<EOF
[Unit]
Description=Yoda Daemon
After=network-online.target

[Service]
User=$USERNAME
ExecStart=/home/$USERNAME/go/bin/yoda run
Restart=always
RestartSec=3
LimitNOFILE=4096

[Install]
WantedBy=multi-user.target
EOF

echo "✅ Servicio yoda.service creado correctamente."

