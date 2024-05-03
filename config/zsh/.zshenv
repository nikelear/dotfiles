# shell-boot profile
# zmodload zsh/zprof

# add path
path=(
  "${HOME}/.local/share/bin"(N-/)
  "${HOME}/dotfiles/bin"
  "$path[@]"
)

# load common env
source $HOME/.config/sh/env.sh

# zsh
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export HISTFILE="${ZDOTDIR}/.zsh_history"
export HISTSIZE=100000
export SAVEHIST=1000000

# abbr
export ABBR_SET_EXPANSION_CURSOR=1
export ABBR_SET_LINE_CURSOR=1

[ -e "${HOME}/local.zshenv" ] && . "${HOME}/local.zshenv"

# zsh -xvic 'exit' &> ~/zsh_startup_log
