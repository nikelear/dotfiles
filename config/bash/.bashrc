#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# command -v starship &> /dev/null && eval "$(starship init bash)"


BASH_DIR="${HOME}/.config/bash"
if [ -d $BASH_DIR ] && [ -r $BASH_DIR ] && [ -x $BASH_DIR ]; then
  for file in ${BASH_DIR}/**/*.bash; do
    [ -r $file ] && source $file
  done
fi

source $HOME/bash-abbrev-alias/abbrev-alias.plugin.bash

abbrev-alias -g G="| grep"


source $HOME/fzf-tab-completion/bash/fzf-bash-completion.sh
bind -x '"\t": fzf_bash_completion'
