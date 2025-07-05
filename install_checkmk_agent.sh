#!/bin/bash

# Atualiza repositório e instala xinetd (se não tiver)
if ! command -v xinetd >/dev/null 2>&1; then
  apt update
  apt install -y xinetd
fi

# Baixa agente com redirecionamento
curl -LO https://download.checkmk.com/checkmk/2.2.0p17/check-mk-agent_2.2.0p17-1_all.deb

# Verifica se o arquivo está ok
file check-mk-agent_2.2.0p17-1_all.deb

# Instala agente
dpkg -i check-mk-agent_2.2.0p17-1_all.deb

# Reinicia e habilita xinetd
systemctl restart xinetd
systemctl enable xinetd

echo "Checkmk Agent instalado e rodando na porta 6556"
