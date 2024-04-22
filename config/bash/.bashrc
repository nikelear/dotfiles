#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source $HOME/.config/sh/function.sh

__load_configure "${HOME}/.config/bash/rc"

# source $HOME/bash-abbrev-alias/abbrev-alias.plugin.bash
# abbrev-alias -g G="| grep"

# source $HOME/fzf-tab-completion/bash/fzf-bash-completion.sh
# bind -x '"\t": fzf_bash_completion'
