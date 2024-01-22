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
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
else
  PROMPT='%F{green}%n%f%F{red}@%m%f %~ '$'\n$ '
  RPROMPT="%T"
fi

# setting files
ZSH_DIR="${HOME}/.config/zsh/rc"
if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
  for file in ${ZSH_DIR}/**/*.zsh; do
    [ -r $file ] && source $file
  done
fi

# profiling
command -v zprof &> /dev/null && zprof || true