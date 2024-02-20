$PATH="${HOME}\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$TARGET="${HOME}\dotfiles\windows-terminal\settings.json"
Remove-Item $PATH
New-Item -ItemType SymbolicLink -Target $TARGET -Path $PATH