# 🔒 OpenVPN Automation & User Management Toolkit

<p align="center">
  <img src="https://img.shields.io/badge/status-ativo-success?style=for-the-badge&logo=openvpn" alt="Status Ativo">
  <img src="https://img.shields.io/badge/versão-v2.0-blue?style=for-the-badge&logo=git" alt="Versão">
  <img src="https://img.shields.io/badge/shell-bash-orange?style=for-the-badge&logo=gnu-bash" alt="Shell Script">
  <img src="https://img.shields.io/badge/segurança-senhas_aleatórias-critical?style=for-the-badge&logo=awslambda" alt="Segurança">
  <img src="https://img.shields.io/badge/licença-MIT-informational?style=for-the-badge" alt="Licença">
</p>

<p align="center">
  <b>Scripts em Shell para automação ágil de criação, edição de usuários, geração de certificados e empacotamento de perfis (.ovpn) no OpenVPN.</b>
</p>

---

## 📌 Sobre o Projeto

Este repositório contém utilitários em **Shell Script** projetados para simplificar e acelerar a administração de servidores OpenVPN. Com foco em produtividade e segurança, o conjunto de scripts automatiza o fluxo completo de gerenciamento de acessos — desde a geração de chaves criptográficas (`easy-rsa`) e criação de senhas aleatórias seguras até a montagem final do arquivo de configuração (`.ovpn`) pronto para distribuição ao cliente.

---

## 🚀 Novidades da Versão Atual (v2.0)

- **Geração Automática de Senhas:** Inclusão de rotinas para criar senhas aleatórias e seguras para os novos usuários de forma automatizada.
- **Fluxo Otimizado:** Melhoria na integração entre a criação de certificados via Easy-RSA e a injeção de parâmetros no template base (`.ovpn`).
- **Tratamento de Erros:** Validações robustas para checar a existência prévia de certificados e diretórios antes da execução das rotinas.

---

## 🛠️ Tecnologias e Ferramentas

<p>
  <img src="https://img.shields.io/badge/Linux-FCC624?style=flat-square&logo=linux&logoColor=black" alt="Linux">
  <img src="https://img.shields.io/badge/Bash-4EAA25?style=flat-square&logo=gnu-bash&logoColor=white" alt="Bash">
  <img src="https://img.shields.io/badge/OpenVPN-EA7E20?style=flat-square&logo=openvpn&logoColor=white" alt="OpenVPN">
  <img src="https://img.shields.io/badge/Easy--RSA-795548?style=flat-square&logo=security&logoColor=white" alt="Easy-RSA">
</p>

---

## 📁 Estrutura e Funcionalidades

1. **Criação Automatizada de Usuários:** Interage com o ambiente `easy-rsa` para gerar o par de chaves e certificados digitais com segurança.
2. **Geração de Senhas Dinâmicas:** Cria credenciais fortes de acesso sem intervenção manual complexa.
3. **Montagem do Perfil (`.ovpn`):** Utiliza ferramentas como `awk` para ler o template base (`ArqBase.ovpn`), injetar as tags de certificado (`<cert>`), chaves privadas (`<key>`) e o comando de autenticação (`auth-user-pass`), gerando o arquivo final do cliente de forma limpa.

---

## 📂 Acesso aos Scripts

Você pode acessar os códigos atualizados diretamente pelo diretório do projeto:

- [📁 Scripts Atualizados no Google Drive](https://drive.google.com/drive/folders/1SOjwULVbyzv9r5TJOh6YDSsb4Ts9SX8B?usp=drive_link)

---

## ⚙️ Como Utilizar

1. Clone ou baixe os scripts para o diretório de administração do seu servidor OpenVPN (ex: `/etc/openvpn/scripts/`).
2. Certifique-se de que os arquivos possuem permissão de execução:
   ```bash
   chmod +x *.sh
