# installer-connect
export RSYNC_RSH=ssh
# autorun-editor
export EDITOR=$(command -v nvim || command -v vim)

# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# npm
export NPM_CONFIG_PREFIX="${XDG_DATA_HOME}/npm"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"

# node
export NODE_REPL_HISTORY="${XDG_STATE_HOME}/node_history"

# docker
export DOCKER_CONFIG="${XDG_DATA_HOME}/docker"

# fzf
# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='--bind=tab:down,shift-tab:up --cycle'

# ubuntu
export skip_global_compinit=1

if [ -d /home/linuxbrew ]; then
  if [ ! -f "$XDG_CACHE_HOME/brew.sh" ]; then
    echo "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" > $XDG_CACHE_HOME/brew.sh
  fi
  source $XDG_CACHE_HOME/brew.sh
  export HOMEBREW_NO_AUTO_UPDATE=1
fi
