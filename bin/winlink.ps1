$parentDirectory = Split-Path $(Split-Path $PSCommandPath)

New-Item -ItemType SymbolicLink -Target $parentDirectory\config -Path $env:USERPROFILE\.config 
New-Item -ItemType SymbolicLink -Target "$env:USERPROFILE\.config\powershell" -Path "$env:USERPROFILE\Documents\PowerShell\" 