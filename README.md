![alt text](https://thumbs.dreamstime.com/b/tela-de-computador-com-alertas-do-ataque-do-ransomware-no-vermelho-e-em-um-hacke-92535628.jpg)

# 🔥LucyCrypt🔥
                                                                                                   
![alt text](https://i.ibb.co/CJ93sNY/VID-20230418-170612.gif)

    🎩 Meus script's simples para demonstrações de ataques de Ransomware. 
    💀 Pode ser compilado e usado junto com um script para Ruberduck ou Digispark. 
    💀 Caso seja em sistemas Windows pode ser usado o script em ".bat" para CMD.

# 🔥Ransomware.bat🔥
![alt text](https://media2.giphy.com/media/WTyrLaSidmKYHM9QcA/giphy.gif?cid=ecf05e47olkgmuscfriueqlgebuglg0fvtkhe2ms1l0uj7yc&rid=giphy.gif&ct=g)

❌❌❌ ANTENÇÃO PERIGO! ❌❌❌ Criei este script para fins educacionais. 

Podemos usa-lo como um "Exploit em .bat" com um Digispark (ATtiny85), que uma vez inserido na porta, poderá portanto realizar um ataque HID que infectara toda a pasta (C:) do Windows. Outra dica de uso é move-lo para um diretório escondido, criar um atalho para a Área de Trabalho e alterar seu ícone para algum ícone de Software que a pessoa use (por exemplo um Browser). Assim quando for executa-lo, todo sistema pode ser derrubado. >: Também pode ser feito se programdo em Arduino (C++)

# 💻 Como foi escrito:

![alt text](https://i.ibb.co/5c3HNJw/2023-04-18-17-02-23.png)

O SCRIPT FOI CONSTRUIDO COM BASE NA MINHA ENGENHARIA REVERSA NO PROPRIO RANSOMWARE DO WANNACRY PARA VER SUAS BIBLIOTECAS QUE FORAM USADAS JUNTO COM SUAS API'S. DURANTE MEUS ESTUDOS, POR PADRÃO ELE TAMBEM USA A CIFRA AES (Advanced Encryption Standard) COM BASE EM UMA CHAVE EM DE 128 BIT'S PARA CRIPTOGRAFIA.

É INTERESSANTE OBSERVAR QUE ALEM DESTA BIBLIOTECA ELE USA O : 

1. EternalBlue exploit: um exploit de vulnerabilidade SMB (Server Message Block) que se baseia em uma falha de segurança do Windows. Ja foi muito usado no Metasploit. O mesmo permite criar um Payload que cria um "Bypass" no Windows fazendo com que o Meterpreter ou BackDoor não seja avistada. 

2. DoublePulsar backdoor: um backdoor que é implantado em sistemas vulneráveis ​​pelo EternalBlue exploit.

3. Criptografia RSA e AES: o WannaCry usa a criptografia RSA para criptografar a chave AES que é usada para criptografar os arquivos do usuário.

4. Tor network: o ransomware se comunica com seu servidor de comando e controle (C&C) por meio da rede Tor para evitar ser rastreado.

5. Bitcoin: o WannaCry exige um pagamento em Bitcoin para descriptografar os arquivos do usuário.

6. Windows API: o ransomware usa várias funções da API do Windows para se espalhar pela rede e criptografar arquivos. 
