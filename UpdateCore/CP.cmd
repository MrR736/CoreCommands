@echo off
cd "%ProgramData%\PhoenixOS"
mkdir Update
cd %ProgramData%\PhoenixOS\Update
wget https://github.com/MrR736/Core/archive/refs/heads/main.zip
7za x main.zip -o"%ProgramData%\PhoenixOS\Update"
cd %ProgramData%\PhoenixOS\Update
copy "%ProgramData%\PhoenixOS\Core\CoreControls\Txt\del-cp.txt" "%ProgramData%\PhoenixOS\Update"
type del-cp.txt >> core.cmd
start call "%ProgramData%\PhoenixOS\Update\core.cmd"
exit