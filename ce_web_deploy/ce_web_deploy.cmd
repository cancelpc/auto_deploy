@echo off
setlocal

rem Syntax:
rem 	�� Web Root �U�ؿ�����
rem 
rem �`�������ܼơG
rem SystemDrive=C:                              
rem SystemRoot=C:\windows                       
rem TEMP=C:\Temp                                
rem TMP=C:\Temp                                 
rem ProgramFiles=C:\Program Files               
rem ProgramFiles(x86)=C:\Program Files (x86)    
rem ProgramW6432=C:\Program Files               


rem �_�l�ܼ�
set MY_BASE=%~dp0
set MY_HOME=%MY_BASE:~0,-1%


rem SQL Server Compact Edition �ӷ��ؿ�
set CE_ROOT=%ProgramFiles(x86)%\Microsoft SQL Server Compact Edition
set CE_PATH=%CE_ROOT%\v4.0


echo �N %CE_PATH%\Desktop\System.Data.SqlServerCe.dll �ƻs�� ~\bin
robocopy "%CE_PATH%\Desktop" %MY_HOME%\bin /E
rmdir /S /Q %MY_HOME%\bin\System.Data.SqlServerCe.Entity

echo �N %CE_PATH%\Desktop\System.Data.SqlServerCe.Entity\System.Data.SqlServerCe.Entity.dll �ƻs�� ~\bin
robocopy "%CE_PATH%\Desktop\System.Data.SqlServerCe.Entity" %MY_HOME%\bin /E

echo �N %CE_PATH%\Private\x86\* �ƻs�� ~bin\x86
robocopy "%CE_PATH%\Private\x86" %MY_HOME%\bin\x86 /E

echo �N %CE_PATH%\Private\amd64\* �ƻs�� ~bin\amd64
robocopy "%CE_PATH%\Private\amd64" %MY_HOME%\bin\amd64 /E


endlocal
