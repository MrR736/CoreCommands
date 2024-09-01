
cd "%root%"
mkdir Update
cd %root%\Update
wget https://github.com/MrR736/Core/archive/refs/heads/main.zip
7za x main.zip -o%root%\Update
cd %core%
mkdir CoreSotfwares
del /s /q "%root%\Update\main.zip"
del /s /q "%core%\CoreSotfwares"
xcopy /s /y "%root%\Update\Core-main\CoreSotfwares" "%core%\CoreSotfwares"
rd /s /q "%root%\Update"
cd %core%
exit