#!/bin/bash

# Caminho para o diretório easy-rsa
EASYRSA_DIR="/etc/openvpn/easy-rsa"

# Navegar até o diretório easy-rsa
cd "$EASYRSA_DIR" || exit

# Função para verificar se o usuário já existe
user_exists() {
    local username=$1
    if [ -e "pki/issued/$username.crt" ]; then
        return 0  # O usuário existe
    else
        return 1  # O usuário não existe
    fi
}

# Solicitar nome do usuário
read -p "Digite o nome do usuário: " USERNAME

# Verificar se o usuário já existe
if user_exists "$USERNAME"; then
    echo "Erro: O usuário $USERNAME já existe."
    exit 1
fi

# Gerar requisição para o novo usuário
./easyrsa gen-req "$USERNAME"

# Criar senha para o usuário
read -s -p "Digite a senha para o usuário $USERNAME: " PASSWORD
echo "$PASSWORD" > "pki/private/$USERNAME.pass"

# Confirmar a senha
read -s -p "Repita a senha: " CONFIRM_PASSWORD
echo "$CONFIRM_PASSWORD" > "pki/private/$USERNAME.pass"

# Assinar a requisição do cliente
./easyrsa sign-req client "$USERNAME"

# Copiar certificados e chaves para o diretório do cliente
CLIENT_DIR="/etc/openvpn/client/"
cp "pki/ca.crt" "$CLIENT_DIR"
cp "pki/issued/$USERNAME.crt" "$CLIENT_DIR"
cp "pki/private/$USERNAME.key" "$CLIENT_DIR"

echo "Usuário $USERNAME criado com sucesso. Certificados e chaves foram copiados para $CLIENT_DIR"

# Executar o segundo script
bash /sua_pasta/ArqOvpn.sh "$USERNAME"

