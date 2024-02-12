# add path
path=(
  "${HOME}/.cargo/bin"(N-/)
  "${DENO_INSTALL}/bin"(N-/)
  "${GOPATH}/bin"(N-/)
  "$path[@]"
)
path=("${(@u)path}")

# plugin
command -v sheldon &> /dev/null && eval "$(sheldon source)"

# prompt
PROMPT='%F{green}%n%f%F{red}@%m%f %~ '$'\n$ '
RPROMPT="%T"
command -v starship &> /dev/null && eval "$(starship init zsh)"

# # setting files
# ZSH_DIR="${HOME}/.config/zsh/rc"
# if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
#   for file in ${ZSH_DIR}/**/*.zsh; do
#     [ -r $file ] && source $file
#   done
# fi

if [ -e "${HOME}/.local/bin/mise" ]; then
  if [ ! -e "${HOME}/.cache/mise.zsh"]; then
    echo "$(${HOME}/.local/bin/mise activate zsh)" > "${HOME}/.cache/mise.zsh"
  fi
  source "${HOME}/.cache/mise.zsh"
fi

# profiling
command -v zprof &> /dev/null && zprof || true
