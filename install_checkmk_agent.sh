#!/bin/bash

# Atualizar sistema e instalar xinetd, se necessário
apt update
apt install -y xinetd curl

# Baixar agente com opção -L para seguir redirecionamentos
curl -LO https://download.checkmk.com/checkmk/2.2.0p17/check-mk-agent_2.2.0p17-1_all.deb

# Verificar se arquivo é pacote Debian
file check-mk-agent_2.2.0p17-1_all.deb

# Instalar agente
dpkg -i check-mk-agent_2.2.0p17-1_all.deb

# Reiniciar e habilitar xinetd
systemctl restart xinetd
systemctl enable xinetd

echo "Checkmk Agent instalado e rodando na porta 6556"
