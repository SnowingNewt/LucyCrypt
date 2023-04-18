#!/bin/bash

#Instala o pycriptodome

pip install pycryptodome

#Baixa o pacote pycrpto

wget "https://files.pythonhosted.org/packages/60/db/645aa9af249f059cc3a368b118de33889219e0362141e75d4eaf6f80f163/pycrypto-2.6.1.tar.gz"

#Descompacta o arquivo

tar -xzf pycrypto-2.6.1.tar.gz

#Apos isso sera necessario instala-lo e instalar os requisitos

cd pycrypto-2.6.1 && python3 setup.py install

