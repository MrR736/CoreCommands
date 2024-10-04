@echo off
title UpdateCore /P

REM Server to be pinged
SET server=github.com
REM Size of packet to be send to server (bytes)
SET packetSize=1
REM Network info
SET netSSID=[SSID]
SET netName=[Network Name]
SET netInterface=[Network Interface]
REM Pause time between each network check (seconds)
SET successfulTimeout=10
REM Pause time after reconnection before next check (seconds)
SET failedTimeout=5
REM Write failed network connections to log (Boolean)
SET writeToLog=1

REM Do not change
SET lastFail=never
SET successfulRepetitions=0

REM Check internet connection
:check
cls
ECHO Pinging %server%...
PING -n 1 -l %packetSize% %server% >NUL
IF %errorlevel% EQU 0 GOTO successful
GOTO failed

REM Internet connection succeeded
:successful
title UpdateCore /P
color FA
set /p cp=<CorePath
mkdir "%temp%\CoreP"
copy "CorePath" "%temp%\CoreP"
wget -q -O".\url" "https://raw.githubusercontent.com/MrR736/CoreAbout/refs/heads/main/Url/Core"
set /p url=<url
del /q ".\url"
wget -q -O"%temp%\CoreP\Core.csp.xz" %url%
7z x "%temp%\CoreP\Core.csp.xz" -o"%temp%\CoreP" > NUL
del /q "%temp%\CoreP\Core.csp.xz"
type "%cp%\CoreControls\Txt\del-p.txt"  >> "%temp%\CoreP\core.cmd"
start cmd.exe /c call "%temp%\CoreP\core.cmd"
exit

REM Internet connection failed
:failed
title UpdateCore /P
Color F4
cls 
ECHO Sorry But You Need to Enable Your Internet To Download CorePackages
ECHO:
ECHO Reasons For Connection to The Internet to Download The Latest Version Of CorePackages
ECHO:
set /P c=Do You Want To Check Your Internet Again[Y/N]?
if /I "%c%" EQU "Y" goto :y
if /I "%c%" EQU "y" goto :y
if /I "%c%" EQU "N" goto :n
if /I "%c%" EQU "n" goto :n
ECHO Indecisive.
pause
goto :failed

:y
GOTO check

:n
exit
