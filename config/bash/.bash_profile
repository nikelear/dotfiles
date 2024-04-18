#
# ~/.bash_profile
#
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi
[ -d /home/linuxbrew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
export HISTFILE="${HOME}/.cache/bash_history"
export PATH="${HOME}/.local/bin:${PATH}"

export BASHRC="$XDG_CONFIG_HOME/bash/.bashrc"
