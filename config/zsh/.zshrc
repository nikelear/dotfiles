# rust
case ":${PATH}:" in
  *:"$HOME/.cargo/bin":*)
    ;;
  *)
    # Prepending path in case a system-installed rustc needs to be overridden
    export PATH="$HOME/.cargo/bin:$PATH"
    ;;
esac

# deno
case ":${PATH}:" in
  *:"${DENO_INSTALL}/bin":*)
    ;;
  *)
    # Prepending path in case a system-installed rustc needs to be overridden
    export PATH="${DENO_INSTALL}/bin:$PATH"
    ;;
esac

# go
case ":${PATH}:" in
  *:"${GOPATH}/bin":*)
    ;;
  *)
    # Prepending path in case a system-installed rustc needs to be overridden
    export PATH="${GOPATH}/bin:$PATH"
    ;;
esac

# plugin
if [ -f $HOME/.cargo/bin/sheldon ]; then
  eval $(sheldon source)
else
  PROMPT=$'%F{yellow}%n%f%F{green}@%m%f %~ \n$ '
  RPROMPT='%T'
fi

# setting files
ZSH_DIR="${HOME}/.config/zsh/rc"
if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
  for file in ${ZSH_DIR}/**/*.zsh; do
    [ -r $file ] && source $file
  done
fi

ZENO="${HOME}/.local/share/sheldon/repos/github.com/yuki-yano/zeno.zsh"
if [ -d ${ZENO} ]; then
  source "${ZENO}/zeno.zsh"
fi

if [ -d /home/linuxbrew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# prompt
if [ -e $HOME/.cargo/bin/starship ]; then
  eval "$(starship init zsh)"
fi

# profiling
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
