# Execução do script para criar usuário e certificados

Através do uso de script nesse breve tutorial será ensinado como criar um usuário de forma fácil até mesmo para leigos. 

lINK PARA DOWNLOAD DOS ARQUIVOS > https://drive.google.com/drive/folders/1SOjwULVbyzv9r5TJOh6YDSsb4Ts9SX8B?usp=drive_link

Executando o primeiro script : ./NewUserOpenvpn.sh

1- Insira um nome para o usuário.

2- Insira uma senha.

3- Repita a senha.

Pode ser q tenha q repetir tudo de novo por causa do script, mas será durante a execução, e não ter executar o script novamente.

Após a execução desses passos, outro script será executado pelo sistema.

 Em seguida, caso o primeiro script não tenha executado o comando bash para executar o segundo script, digite: ./ArqOvpn.sh

Digite o nome do usuário.

Após isso será criado o certificado.

ATENÇÃO !

Será necessário fazer algumas alterações com o nome do diretório que você criou, caso queira criar uma pasta e não saiba, segue abaixo:

*Por segurança é melhor criar dentro do dirétorio do seu usuário.

comando para criar a pasta,  os certificados e informações do usuários serão colocados nela: mkidr /home/seu_usuário/nome_da_pasta

# Adaptar certificado para outros servidores 

ARQUIVO DE MODELO: ArqBase.ovpn

Para realizar a adaptação é necessário encontrar os arquivos static.key e ca.crt.

Para ir ao local de origem desses arquivos digite: cd /etc/openvpn

Execute o arquivo com o comando cat dessa forma: cat ca.crt
 
Após executar o arquivo ca.crt, copie a informação de -----BEGIN CERTIFICATE----- entre -----END CERTIFICATE----- comece pela esquerda superior e copie tudo.

Em seguida execute: cat static.key

Após executar o arquivo  static.key, copie a informação de -----BEGIN OpenVPN Static key V1----- entre -----END OpenVPN Static key V1----- comece pela esquerda superior e copie tudo.

Faça na ordem que desejar, mas faça de um por um, copie o conteúdo e vá na pasta onde se encontra o ArqBase.ovpn, execute o comando: nano ArqBase.ovpn

Substitua pelo copiou em ca.crt e static.key.

Pressione ctrl + 6 para selecionar

Após ter feito a seleção, pressione crtl + k para “apagar”.

Em seguida cole o conteúdo copiado.

Lembre-se de colocar seu ip e a porta em: remote ip_do_seu_servidor sua_porta
