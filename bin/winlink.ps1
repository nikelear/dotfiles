New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.config" -Target "$env:USERPROFILE\dotfiles\.config"
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\alacritty" -Target "$env:USERPROFILE\.config\alacritty"
New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\Documents" -Target "$env:USERPROFILE\OneDrive\Documents"

$filePath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
if (Test-Path $filePath) {Remove-Item $filePath}
New-Item -ItemType HardLink -Path "$env:USERPROFILE\.config\windows-terminal\settings.json" -Target $filePath