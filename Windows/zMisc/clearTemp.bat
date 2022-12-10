@echo off
REM Run as admin or not everything will be deleted (open files still won't delete but that's always the case; ssyinternals can help narrow down why its in use)
echo[ && Echo ================================== && echo Press any key to clear temp files: && Echo ==================================
echo[ && pause
rmdir /s /q C:\Users\Chris\AppData\Local\Temp && rmdir /s /q C:\Windows\Temp && timeout /t 003 && exit