# shell-boot profile
# zmodload zsh/zprof

# installer-connect
export RSYNC_RSH=ssh

# autorun-editor
export EDITOR=$(command -v nvim || command -v vim)

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--height=60% --reverse --preview 'head -100 {}'"

# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# npm
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"

# go
export GOPATH="${XDG_DATA_HOME}/go"

# deno
export DENO_INSTALL="${XDG_DATA_HOME}/.deno"
export DENO_CERT="/etc/ssl/certs/ca-certificates.crt"

# node
export NODE_REPL_HISTORY="${XDG_STATE_HOME}/node_history"

# zsh
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export HISTFILE="${ZDOTDIR}/.zsh-history"
export HISTSIZE=100000
export SAVEHIST=1000000

[ -e "${HOME}/local.zshenv" ] && . "${HOME}/local.zshenv"