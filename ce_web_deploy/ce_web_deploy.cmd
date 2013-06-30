@echo off
setlocal

rem Syntax:
rem 	於 Web Root 下目錄執行
rem 
rem 常用環境變數：
rem SystemDrive=C:                              
rem SystemRoot=C:\windows                       
rem TEMP=C:\Temp                                
rem TMP=C:\Temp                                 
rem ProgramFiles=C:\Program Files               
rem ProgramFiles(x86)=C:\Program Files (x86)    
rem ProgramW6432=C:\Program Files               


rem 起始變數
set MY_BASE=%~dp0
set MY_HOME=%MY_BASE:~0,-1%


rem SQL Server Compact Edition 來源目錄
set CE_ROOT=%ProgramFiles(x86)%\Microsoft SQL Server Compact Edition
set CE_PATH=%CE_ROOT%\v4.0


echo 將 %CE_PATH%\Desktop\System.Data.SqlServerCe.dll 複製到 ~\bin
robocopy "%CE_PATH%\Desktop" %MY_HOME%\bin /E
rmdir /S /Q %MY_HOME%\bin\System.Data.SqlServerCe.Entity

echo 將 %CE_PATH%\Desktop\System.Data.SqlServerCe.Entity\System.Data.SqlServerCe.Entity.dll 複製到 ~\bin
robocopy "%CE_PATH%\Desktop\System.Data.SqlServerCe.Entity" %MY_HOME%\bin /E

echo 將 %CE_PATH%\Private\x86\* 複製到 ~bin\x86
robocopy "%CE_PATH%\Private\x86" %MY_HOME%\bin\x86 /E

echo 將 %CE_PATH%\Private\amd64\* 複製到 ~bin\amd64
robocopy "%CE_PATH%\Private\amd64" %MY_HOME%\bin\amd64 /E


endlocal
