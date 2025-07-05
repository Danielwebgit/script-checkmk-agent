#!/bin/bash

# Instala xinetd
apt update && apt install -y xinetd

# Baixa agente oficial
curl -O https://download.checkmk.com/checkmk/2.2.0p17/check-mk-agent_2.2.0p17-1_all.deb

# Instala agente
dpkg -i check-mk-agent_2.2.0p17-1_all.deb

# Reinicia xinetd
systemctl restart xinetd
systemctl enable xinetd

# Confirma status
echo "Checkmk Agent instalado e rodando na porta 6556"
