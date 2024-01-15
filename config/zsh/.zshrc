# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
  *:"$HOME/.deno/bin":*)
    ;;
  *)
    # Prepending path in case a system-installed rustc needs to be overridden
    export PATH="$HOME/.deno/bin:$PATH"
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

# prompt
if [ -e $HOME/.cargo/bin/starship ]; then
  eval "$(starship init zsh)"
fi

# profiling
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
