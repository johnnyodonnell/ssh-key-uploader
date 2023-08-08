
@echo off
echo What is the title of this key?
set /p title=
echo.

echo Paste your Access token here:
set /p token=
echo.

set /p ssh_key=<C:\Users\%USERNAME%\.ssh\id_rsa.pub

:: Escape backslash to account for user names with backslashes, such as
:: domain\username@computername
set ssh_key=%ssh_key:\=\\%

curl -H "Authorization: token %token%" --data "{\"title\": \"%title%\", \"key\": \"%ssh_key%\"}" https://api.github.com/user/keys

