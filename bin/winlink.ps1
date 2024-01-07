New-Item -ItemType SymbolicLink -Path "$env:HOME\.config" -Target "$env:HOME\dotfiles\.config"
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\alacritty" -Target "$env:USERPROFILE\.config\alacritty"
New-Item -ItemType SymbolicLink -Path "$env:HOME\Documents" -Target "$env:HOME\OneDrive\Documents"