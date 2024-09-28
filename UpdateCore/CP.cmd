@echo off
title UpdateCore /CP

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
title UpdateCore /CP
color FA
set /p cp=<CorePath
wget -q -O"%temp%\main.zip" https://github.com/MrR736/Core/archive/refs/heads/main.zip
7z x "%temp%\main.zip" -o"%temp%\Update"
del /q "%temp%\main.zip"
type "%cp%\CoreControls\Txt\del-cp.txt" >> "%temp%\Update\core.cmd"
copy "CorePath" "%temp%\Update"
start cmd.exe /c call "%temp%\Update\core.cmd"
exit

REM Internet connection failed
:failed
title UpdateCore /CP
Color F4
cls 
ECHO Sorry But You Need to Enable Your Internet To Download CorePrompt
ECHO:
ECHO Reasons For Connection to The Internet to Download The Latest Version Of CorePrompt
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