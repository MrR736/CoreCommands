@echo off
cd "%root%"
mkdir Update
cd %root%\Update
wget https://github.com/MrR736/CoreSettings/archive/refs/heads/main.zip
7za x main.zip -o%root%\Update
del /s /q "%root%\Update\main.zip"
xcopy /s /y "%root%\Update\CoreSettings-main" "%core%\CoreSettings"
rd /s /q "%root%\Update"
exit