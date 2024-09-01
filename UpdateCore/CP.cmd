@echo off
cd "%root%"
mkdir Update
cd %root%\Update
wget https://github.com/MrR736/Core/archive/refs/heads/main.zip
7za x main.zip -o%root%\Update
cd %root%\Update
copy "%Core%\CoreControls\Txt\del-cp.txt" "%root%\Update"
type del-cp.txt >> core.cmd
start call "%root%\Update\core.cmd"
exit