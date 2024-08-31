
cd "%root%"
mkdir Update
cd %root%\Update
wget https://github.com/MrR736/Core/archive/refs/heads/main.zip
setlocal

Call :UnZipFile "%root%\Update" "%root%\Update\main.zip"
exit /b

:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%

cd %core%
mkdir CoreSotfwares
del /s /q "%root%\Update\main.zip"
del /s /q "%core%\CoreSotfwares"
xcopy /s /y "%root%\Update\Core-main\CoreSotfwares" "%core%\CoreSotfwares"
rd /s /q "%root%\Update"
cd %core%
exit