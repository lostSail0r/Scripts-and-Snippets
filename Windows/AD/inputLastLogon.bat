REM - NOTE: You must be connected to domain network (or at least have DC as DNS server if theres a network path; sometimes connecting to corp VPN will also work)
REM - Note: If you are running this against a local account, remove the "/domain" from line 10
@echo off

echo Find User's Last Login Time:
echo ============================

SET /P user=Enter Username:

net user %user% /domain | findstr /B /C:"Last logon"

pause
