# add path
path=(
  "$path[@]"
)
path=("${(@u)path}")

cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}"
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
load_settings () {
  local target=$1
  local config="${config_dir}/${2}"
  local command=${3}
  local cache="${cache_dir}/$target.zsh"

  if command -v $target &> /dev/null; then
    if [[ ! -r "$cache" || "$config" -nt "$cache" ]]; then
      mkdir -p $cache_dir
      eval $command > "$cache"
    fi
    source "${cache}"
  fi
}

# runtime manager
load_settings mise "mise/config.toml" "mise activate zsh"

# plugin
load_settings sheldon "sheldon/plugins.toml" "sheldon source"

# prompt
PROMPT='%F{green}%n%f%F{red}@%m%f %~ '$'\n$ '
RPROMPT="%T"
load_settings starship "starship.toml" "starship init zsh"

unset cache_dir config_dir

# setting files
ZSH_DIR="${ZDOTDIR}/rc"
if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
  for file in ${ZSH_DIR}/**/*.zsh; do
    [ -r $file ] && source $file
  done
fi

# profiling
command -v zprof &> /dev/null && zprof || true
