#!/usr/bin/env bash

# installer-connect
export RSYNC_RSH=ssh

# XDG
export XDG_CONFIG_HOME="${HOME}/.config"
export XDG_CACHE_HOME="${HOME}/.cache"
export XDG_DATA_HOME="${HOME}/.local/share"
export XDG_STATE_HOME="${HOME}/.local/state"

# autorun-editor
export EDITOR=$(command -v nvim || command -v vim)
if [ -e "${XDG_CONFIG_HOME}/nvim/init.vim" ]; then  
  export VIMINIT=":source ${XDG_CONFIG_HOME}/nvim/init.vim"
fi

# npm
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"

# node
export NODE_REPL_HISTORY="${XDG_STATE_HOME}/node_history"