@echo off

echo Find User's Last Login Time:
echo ============================

SET /P url=Enter Username:

net user %url% /domain | findstr /B /C:"Last logon"

pause