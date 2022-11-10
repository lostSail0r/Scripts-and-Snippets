@echo off

echo works in only very specific file path placement but will upload version that doesnt care where this file is stored in relation to the .ost or .pst
also note to self - add *.pst in backup ost line to sync both if they cache their mailbox

setlocal
set LogPath="C:\logs\test"
set outlookMailboxExt=.log
set outlookMailboxName=Daily Backup%outlookMailboxExt%
::use set outlookMailbox=%date:~4% instead to remove the day of the week
set outlookMailbox=%date%
set outlookMailbox=%outlookMailbox:/=-%
set outlookMailbox=%LogPath%%outlookMailbox%_%outlookMailboxName%
::Note that the quotes are REQUIRED around %outlookMailbox% in case it contains a space
If NOT Exist "%outlookMailbox%" goto:noseparator
Echo.>>"%outlookMailbox%"
Echo.===================>>"%outlookMailbox%"
:noseparator
echo.%Date% >>"%outlookMailbox%"
echo.%Time% >>"%outlookMailbox%"

@echo START TASK FOR USER: %USERNAME% >>"%outlookMailbox%"

@echo Killing Outlook process and waiting a few seconds before continuing! >>"%outlookMailbox%"
taskkill /im outlook.exe >>"%outlookMailbox%"
@ping 127.0.0.1 -n 2 -w 1000 > nul >>"%outlookMailbox%"
@ping 127.0.0.1 -n 2 -w 1000> nul >>"%MyLogFile%"
@echo Killed Outlook process. >>"%MyLogFile%"

@echo backup of PST files starting..... >>"%MyLogFile%"
@echo please wait.. >>"%MyLogFile%"
@echo please wait.. >>"%MyLogFile%"

@echo MAKING DIRECTORY!!!!! >>"%MyLogFile%"
mkdir C:\logs\%USERNAME%\ >>"%MyLogFile%"
@echo Done creating directory. >>"%MyLogFile%"

@echo DONE! >>"%MyLogFile%"

@echo Starting copy of PST file!!!! >>"%MyLogFile%"
copy "C:\Users\%username%\AppData\Local\Microsoft\Outlook\*.ost" "C:\logs\%USERNAME%\" /y >>"%MyLogFile%"
@echo Finished copy of PST file. >>"%MyLogFile%"

@echo DONE FOR USER %USERNAME%...... >>"%MyLogFile%"