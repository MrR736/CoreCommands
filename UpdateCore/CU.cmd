@echo off
cd "%root%"
mkdir Update
cd %root%\Update
wget https://github.com/MrR736/CoreUpdates/archive/refs/heads/main.zip
7za x main.zip -o%root%\Update
del /s /q "%root%\Update\main.zip"
del /s /q "%core%\CoreUpdates"
xcopy /s /y "%root%\Update\CoreUpdates-main" "%core%\CoreUpdates"
rd /s /q "%root%\Update"
exit