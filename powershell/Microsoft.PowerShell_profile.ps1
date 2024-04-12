$ENV:LANG = "en_US.UTF-8"

# XDG
$ENV:XDG_CONFIG_HOME="${HOME}\.config"
$ENV:XDG_CACHE_HOME="${HOME}\.cache"
$ENV:XDG_DATA_HOME="${HOME}\.local\share"
$ENV:XDG_STATE_HOME="${HOME}\.local\state"

# fzf
$ENV:FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# deno
$ENV:DENO_INSTALL="${HOME}\.local\share\.deno"

# go
$ENV:GOPATH="${HOME}\.local\share\go"

# npm
$ENV:NPM_CONFIG_USERCONFIG="${HOME}/.config/npm/npmrc"

$LOCALCONF="$HOME\Documents\PowerShell\local.ps1"
if ( Test-Path $LOCALCONF ) { . $LOCALCONF } else { echo "boke" }
