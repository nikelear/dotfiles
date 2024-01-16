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
cache_dir=${XDG_CACHE_HOME:-$HOME/.cache}
sheldon_cache="$cache_dir/sheldon.zsh"
sheldon_toml="$HOME/.config/sheldon/plugins.toml"
# キャッシュがない、またはキャッシュが古い場合にキャッシュを作成
if [[ ! -r "$sheldon_cache" || "$sheldon_toml" -nt "$sheldon_cache" ]]; then
  mkdir -p $cache_dir
  rm -f $sheldon_cache
  sheldon source > $sheldon_cache
fi
source "$sheldon_cache"
unset cache_dir sheldon_cache sheldon_toml

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

# prompt
if [ -e $HOME/.cargo/bin/starship ]; then
  eval "$(starship init zsh)"
fi

# profiling
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi
