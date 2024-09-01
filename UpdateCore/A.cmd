@echo off
cd "%root%"
mkdir Update
cd %root%\Update
wget https://github.com/MrR736/CoreUpdates/archive/refs/heads/main.zip
7za x main.zip -o%root%\Update
del /s /q "%root%\Update\main.zip"
wget https://github.com/MrR736/CoreSettings/archive/refs/heads/main.zip
7za x main.zip -o%root%\Update
del /s /q "%root%\Update\main.zip"
wget https://github.com/MrR736/CoreControls/archive/refs/heads/main.zip
7za x main.zip -o%root%\Update
del /s /q "%root%\Update\main.zip"
wget https://github.com/MrR736/CoreCommands/archive/refs/heads/main.zip
7za x main.zip -o%root%\Update
del /s /q "%root%\Update\main.zip"
wget https://github.com/MrR736/Core/archive/refs/heads/main.zip
7za x main.zip -o%root%\Update
copy "%core%\CoreControls\Txt\del.txt" "%root%\Update"
type del.txt >> core.cmd
start core.cmd
exit