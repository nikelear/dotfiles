# # add path
path=(
  "${HOME}/.cargo/bin"(N-/)
  "${DENO_INSTALL}/bin"(N-/)
  "${GOPATH}/bin"(N-/)
  "$path[@]"
)
path=("${(@u)path}")

# plugin
if type sheldon &> /dev/null; then
  eval "$(sheldon source)"
else
  PROMPT='%F{green}%n%f%F{red}@%m%f %~ '$'\n$ '
  RPROMPT="%T"
fi

# prompt
type starship &> /dev/null && eval "$(starship init zsh)"

# setting files
ZSH_DIR="${HOME}/.config/zsh/rc"
if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
  for file in ${ZSH_DIR}/**/*.zsh; do
    [ -r $file ] && source $file
  done
fi

# profiling
type zprof &> /dev/null && zprof || true