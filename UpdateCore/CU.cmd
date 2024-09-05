@echo off
cd "%ProgramData%\PhoenixOS"
mkdir Update
cd %ProgramData%\PhoenixOS\Update
wget https://github.com/MrR736/CoreUpdates/archive/refs/heads/main.zip
7za x main.zip -o"%ProgramData%\PhoenixOS\Update"
del /s /q "%ProgramData%\PhoenixOS\Update\main.zip"
del /s /q "%ProgramData%\PhoenixOS\Core\CoreUpdates"
xcopy /s /y "%ProgramData%\PhoenixOS\Update\CoreUpdates-main" "%ProgramData%\PhoenixOS\Core\CoreUpdates"
rd /s /q "%ProgramData%\PhoenixOS\Update"
exit