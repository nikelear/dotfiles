# shell-boot profile
# zmodload zsh/zprof

# installer-connect
export RSYNC_RSH=ssh

# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# autorun-editor
export EDITOR=$(command -v nvim ||command -v vim)
export VIMINIT=":source ${XDG_CONFIG_HOME}/nvim/init.vim"

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS="--height=60% --reverse --preview 'head -100 {}'"

# npm
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"

# go
export GOPATH="${XDG_DATA_HOME}/go"

# node
export NODE_REPL_HISTORY="${XDG_STATE_HOME}/node_history"

# zsh
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export HISTFILE="${ZDOTDIR}/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=1000000

[ -e "${HOME}/local.zshenv" ] && . "${HOME}/local.zshenv"

# zsh -xvic 'exit' &> ~/zsh_startup_log.txt