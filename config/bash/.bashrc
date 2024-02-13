#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTFILE="${HOME}/.cache/hist"
command -v starship &> /dev/null && eval "$(starship init bash)"