@echo off
setlocal

:: home directory
set "USERHOME=%HOMEDRIVE%%HOMEPATH%"

:: make symbolic link
mklink /D "%USERHOME%\Documents\PowerShell\" "%USERHOME%\.config\powershell"

endlocal
