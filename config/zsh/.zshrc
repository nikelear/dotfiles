# # rust
# case ":${PATH}:" in
#   *:"$HOME/.cargo/bin":*)
#     ;;
#   *)
#     # Prepending path in case a system-installed rustc needs to be overridden
#     export PATH="$HOME/.cargo/bin:$PATH"
#     ;;
# esac

# # deno
# case ":${PATH}:" in
#   *:"${DENO_INSTALL}/bin":*)
#     ;;
#   *)
#     # Prepending path in case a system-installed rustc needs to be overridden
#     export PATH="${DENO_INSTALL}/bin:$PATH"
#     ;;
# esac

# # go
# case ":${PATH}:" in
#   *:"${GOPATH}/bin":*)
#     ;;
#   *)
#     # Prepending path in case a system-installed rustc needs to be overridden
#     export PATH="${GOPATH}/bin:$PATH"
#     ;;
# esac

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

# if type deno &> /dev/null; then
#   source "${HOME}/.local/share/sheldon/repos/github.com/yuki-yano/zeno.zsh/zeno.zsh"
# fi

# setting files
ZSH_DIR="${HOME}/.config/zsh/rc"
if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
  for file in ${ZSH_DIR}/**/*.zsh; do
    [ -r $file ] && source $file
  done
fi

if type brew &> /dev/null; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# prompt
if type starship &> /dev/null; then
  eval "$(starship init zsh)"
fi

# profiling
if type zprof &> /dev/null; then
  zprof
fi
