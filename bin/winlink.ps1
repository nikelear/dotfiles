New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\config" -Target "$env:USERPROFILE\dotfiles\.config"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\Documents\PowerShell\" -Target "$env:USERPROFILE\.config\powershell"

$filePath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
if (Test-Path $filePath) {Remove-Item $filePath}
New-Item -ItemType HardLink -Path $filePath -Target "$env:USERPROFILE\.config\windows-terminal\settings.json"