

## 📜 Script `install_checkmk_agent.sh` (se quiser usar)

```bash
#!/bin/bash

# Atualizar repositórios e instalar dependências
apt update && apt install -y xinetd curl

# Baixar agente do Checkmk
curl -LO https://packaging.gitlab.io/repo/debian/pool/bullseye/c/ch/check-mk-agent_2.2.0-1_all.deb

# Verificar se baixou corretamente
file check-mk-agent_2.2.0-1_all.deb

# Instalar o pacote
dpkg -i check-mk-agent_2.2.0-1_all.deb

# Reiniciar e habilitar xinetd
systemctl restart xinetd
systemctl enable xinetd

# Confirmar status
echo "Checkmk Agent instalado e rodando na porta 6556"
