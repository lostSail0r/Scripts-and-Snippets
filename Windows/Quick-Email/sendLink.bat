@echo off
REM THIS ASSUMES YOU ARE SENDING THROUGH GMAIL SMTP BUT THAT CAN BE CHANGED TO ANY SUPPORTED SMTP SERVER (FYI GOOGLE SMTP REQUIRES APP PASSWORD INSTEAD OF REGULAR PW FOR AUTHENTICATING "NOT SECURE APPS")
echo ============================

for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%MM%-%DD%-%YYYY%"

SET /P test=Enter URL and it will be emailed:
sendEmail -f EMAILFROMADDRESS@BLAH.COM -u EMAIL SUBJECT GOES HERE - i ADDED DATE AND TIME BUT ANYTHING BEFORE "-T" IS THE SUBJECT OF EMAIL - %datestamp% -m %test% -t EMAILTOADDRESS@BLAH.COM -s smtp.gmail.com:587 -xu EMAILFROMADDRESS@BLAH.COM -xp EMAILPWGOESHERE -o tls=yes

timeout /t 005 && exit