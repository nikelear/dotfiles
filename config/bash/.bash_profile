#
# ~/.bash_profile
#
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
source "${HOME}/.config/sh/env.sh"
export HISTFILE="${HOME}/.cache/bash_history"
export PATH="${HOME}/.local/bin:${PATH}"
