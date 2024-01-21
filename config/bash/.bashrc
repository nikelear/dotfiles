#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTFILE="${HOME}/.cache/hist"
alias ls='ls --color=auto'
alias grep='grep --color=auto'
. "$HOME/.cargo/env"
eval "$(starship init bash)"
