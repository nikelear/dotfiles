# add path
paths_to_add=(
  "${HOME}/.cargo/bin"
  "${DENO_INSTALL}/bin"
  "${GOPATH}/bin"
)
for pstr in $paths_to_add; do
  if [[ ":$PATH:" != *":$pstr:"* ]]; then
    export PATH="$PATH:$pstr"
  fi
done

# plugin
if type sheldon &> /dev/null; then
  eval $(sheldon source)
else
  PROMPT='%F{green}%n%f%F{red}@%m%f %~ '$'\n$ '
  RPROMPT="%T"
fi

ZENO="${HOME}/.local/share/sheldon/repos/github.com/yuki-yano/zeno.zsh/"
type deno &> /dev/null && [ -d "${ZENO}" ] && zsh-defer source "${ZENO}zeno.zsh"

# homebrew in linux
type brew &> /dev/null && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

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
type zprof &> /dev/null && zprof
