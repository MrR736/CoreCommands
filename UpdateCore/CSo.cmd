@echo off
cd "%ProgramData%\PhoenixOS"
mkdir Update
cd %ProgramData%\PhoenixOS\Update
wget https://github.com/MrR736/Core/archive/refs/heads/main.zip
7za x main.zip -o"%ProgramData%\PhoenixOS\Update"
cd %ProgramData%\PhoenixOS\Core
mkdir CoreSotfwares
del /s /q "%ProgramData%\PhoenixOS\Update\main.zip"
del /s /q "%ProgramData%\PhoenixOS\Core\CoreSotfwares"
xcopy /s /y "%ProgramData%\PhoenixOS\Update\Core-main\CoreSotfwares" "%ProgramData%\PhoenixOS\Core\CoreSotfwares"
rd /s /q "%ProgramData%\PhoenixOS\Update"
cd %ProgramData%\PhoenixOS\Core
exit