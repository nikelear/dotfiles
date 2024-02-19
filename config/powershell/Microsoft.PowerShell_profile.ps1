$ENV:LANG = "en_US.UTF-8"
# prompt
$ENV:STARSHIP_CONFIG = "${HOME}\.config\starship.toml"

# XDG
$ENV:XDG_CONFIG_HOME="${HOME}\.config"
$ENV:XDG_CACHE_HOME="${HOME}\.cache"
$ENV:XDG_DATA_HOME="${HOME}\.local\share"
$ENV:XDG_STATE_HOME="${HOME}\.local\state"

# vim
$ENV:VIMINIT=":source C:/Users/yseki.DKR/.config/nvim/init.vim"

# fzf
$ENV:FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# deno
$ENV:DENO_INSTALL="${HOME}\.local\share\.deno"

# go
$ENV:GOPATH="${HOME}\.local\share\go"

# npm
$ENV:NPM_CONFIG_USERCONFIG="${HOME}/.config/npm/npmrc"

Set-Alias wget Invoke-WebRequest
Function SayHello($name){
    Write-Host "Hello $name!"
}

Function fzf_cd_ghq() {
    $root="$(ghq root)"
    $repo="$(ghq list | fzf --reverse --preview="ls -AF --color=always ${root}/{1}")"
    if ( ! $repo -eq "") { 
        $dir="${root}/${repo}"
        cd "${dir}"
    }
}
Set-PSReadLineKeyHandler -Chord Ctrl+g -ScriptBlock {
    fzf_cd_ghq
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}


Invoke-Expression (&starship init powershell)
