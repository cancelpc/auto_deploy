@echo off
setlocal

set MY_BASE=%~dp0
set MY_HOME=%MY_BASE:~0,-1%

rem SystemDrive=C:
rem SystemRoot=C:\windows
rem TEMP=C:\Temp
rem TMP=C:\Temp
rem ProgramFiles=C:\Program Files
rem ProgramFiles(x86)=C:\Program Files (x86)
rem ProgramW6432=C:\Program Files

set CE_ROOT=%ProgramFiles(x86)%\Microsoft SQL Server Compact Edition
set CE_PATH=%CE_PATH%\v4.0

robocopy "%CE_PATH%\Desktop" %MY_HOME%\bin /E
rmdir /S /Q %MY_HOME%\bin\System.Data.SqlServerCe.Entity

robocopy "%CE_PATH%\Desktop\System.Data.SqlServerCe.Entity" %MY_HOME%\bin /E

robocopy "%CE_PATH%\Private\x86"   %MY_HOME%\bin\x86   /E
robocopy "%CE_PATH%\Private\amd64" %MY_HOME%\bin\amd64 /E


endlocal
