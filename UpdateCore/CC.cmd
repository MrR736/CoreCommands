@echo off
cd "%ProgramData%\PhoenixOS"
mkdir Update
cd %ProgramData%\PhoenixOS\Update
wget https://github.com/MrR736/CoreControls/archive/refs/heads/main.zip
7za x main.zip -o%ProgramData%\PhoenixOS\Update
del /s /q "%ProgramData%\PhoenixOS\Update\main.zip"
xcopy /s /y "%ProgramData%\PhoenixOS\Update\CoreControls-main" "%ProgramData%\PhoenixOS\Core\CoreControls"
rd /s /q "%ProgramData%\PhoenixOS\Update"
exit