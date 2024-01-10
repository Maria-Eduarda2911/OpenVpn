
#!/bin/bash

# Caminho para o diretório easy-rsa
EASYRSA_DIR="/etc/openvpn/easy-rsa"

# Caminho para o diretório de destino
DEST_DIR="/sua_pasta/arqopenvpn"

# Caminho para o arquivo de modelo
MODEL_FILE="/sua_pasta/arqopenvpn/ArqBase.ovpn"

# Solicitar nome do usuário
read -p "Digite o nome do usuário: " USERNAME

# Verificar se o usuário já existe
if [ ! -e "$EASYRSA_DIR/pki/issued/$USERNAME.crt" ] || [ ! -e "$EASYRSA_DIR/pki/private/$USERNAME.key" ]; then
    echo "Erro: Certificados para o usuário $USERNAME não encontrados. Execute o script anterior para criar o usuário."
    exit 1
fi

# Copiar certificados e chaves para o diretório do cliente
CLIENT_DIR="$DEST_DIR"
cp "$EASYRSA_DIR/pki/ca.crt" "$DEST_DIR"
cp "$EASYRSA_DIR/pki/issued/$USERNAME.crt" "$DEST_DIR"
cp "$EASYRSA_DIR/pki/private/$USERNAME.key" "$DEST_DIR"

# Arquivo de modelo .ovpn
TEMPLATE_FILE="$DEST_DIR/ArqBase.ovpn"

# Arquivo de destino .ovpn
OUTPUT_FILE="$CLIENT_DIR/$USERNAME.ovpn"

# Copiar o modelo para o arquivo de destino
cp "$MODEL_FILE" "$OUTPUT_FILE"

# Conteúdo do certificado
CERT_CONTENT=$(cat "$EASYRSA_DIR/pki/issued/$USERNAME.crt")

# Conteúdo da chave
KEY_CONTENT=$(cat "$EASYRSA_DIR/pki/private/$USERNAME.key")

# Gerar o arquivo .ovpn usando awk
awk -v cert_file="$EASYRSA_DIR/pki/issued/$USERNAME.crt" -v key_file="$EASYRSA_DIR/pki/private/$USERNAME.key" '
  BEGIN {
    cert_start="<cert>"
    cert_end="</cert>"
    key_start="<key>"
    key_end="</key>"
    in_cert_block = 0
    in_key_block = 0
  }

  {
    if ($0 ~ cert_start) {
      in_cert_block = 1
      print $0
      while ((getline line < cert_file) > 0) {
        print "" line
      }
    } else if (in_cert_block && $0 ~ cert_end) {
      in_cert_block = 0
      print $0
    } else if ($0 ~ key_start) {
      in_key_block = 1
      print $0
      while ((getline line < key_file) > 0) {
        print "" line
      }
    } else if (in_key_block && $0 ~ key_end) {
      in_key_block = 0
      print $0
    } else if (!in_cert_block && !in_key_block) {
      print $0
    }
  }' "$OUTPUT_FILE" > "$OUTPUT_FILE.tmp" && mv "$OUTPUT_FILE.tmp" "$OUTPUT_FILE"

echo "Usuário $USERNAME criado com sucesso. Certificados e arquivo $USERNAME.ovpn foram copiados para $DEST_DIR"
