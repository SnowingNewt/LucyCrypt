import os
import hashlib
from Crypto.Cipher import AES

# Define a senha usada para criptografar
senha = "537($%@945kJGFJ%#@$"

# Define a funÃ§Ã£o para descriptografar um arquivo
def descriptografar_arquivo(nome_arquivo, senha):
    # Define o tamanho do bloco
    tamanho_bloco = 64 * 1024

    # Gera uma chave de criptografia a partir do hash SHA-256 da senha
    chave = hashlib.sha256(senha.encode()).digest()

    # Abre o arquivo criptografado para leitura
    with open(nome_arquivo, 'rb') as arquivo_criptografado:
        # LÃª o IV a partir do inÃ­cio do arquivo criptografado
        iv = arquivo_criptografado.read(16)

        # Cria um objeto AES para descriptografar os dados
        cifra = AES.new(chave, AES.MODE_CBC, iv)

        # Cria o arquivo de saÃ­da para escrita, removendo a extensÃ£o ".enc"
        nome_arquivo_saida = nome_arquivo[:-4]
        with open(nome_arquivo_saida, 'wb') as arquivo_descriptografado:
            # LÃª o arquivo criptografado em blocos e descriptografa cada bloco
            while True:
                bloco = arquivo_criptografado.read(tamanho_bloco)
                if len(bloco) == 0:
                    break

                # Descriptografa o bloco e escreve no arquivo descriptografado
                arquivo_descriptografado.write(cifra.decrypt(bloco))

            # Remove o preenchimento do Ãºltimo bloco, se houver
            arquivo_descriptografado.truncate(os.path.getsize(nome_arquivo_saida))

    # Apaga o arquivo criptografado
    os.remove(nome_arquivo)

# Percorre todos os arquivos da pasta local e descriptografa cada um
for arquivo in os.listdir("."):
    if os.path.isfile(arquivo) and arquivo.endswith(".enc"):
        descriptografar_arquivo(arquivo, senha)

print("Todos os arquivos foram descriptografados com sucesso!")
