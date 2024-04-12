#
# ~/.bash_profile
#
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
export HISTFILE=~/.local/share/bash_history
export PATH="${HOME}/.local/bin:${PATH}"
