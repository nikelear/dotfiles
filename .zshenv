# shell-boot profile
# zmodload zsh/zprof

# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# autorun-editor
export EDITOR=$(command -v nvim || command -v vim)

# installer-connect
export RSYNC_RSH=ssh

# zsh
export ZDOTDIR="${HOME}/.config/zsh"
export HISTFILE="${ZDORDIR}/.zsh-history"
export HISTSIZE=100000
export SAVEHIST=1000000

# deno
export DENO_INSTALL="${HOME}/.local/share/.deno"
export DENO_CERT="/etc/ssl/certs/ca-certificates.crt"

# go
export GOPATH="${HOME}/.local/share/go"


