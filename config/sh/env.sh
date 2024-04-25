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

# ubuntu
export skip_global_compinit=1

if [ -d /home/linuxbrew ]; then
  if [ ! -e $HOME/.cache/brew.sh ]; then
    echo "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" > $HOME/.cache/brew.sh
  fi
  source $HOME/.cache/brew.sh
fi
