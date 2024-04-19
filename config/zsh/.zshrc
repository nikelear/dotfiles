
source "$HOME/.config/sh/function.sh"

# runtime manager
__load_command mise mise/config.toml "mise activate zsh" zsh

# plugin
__load_command sheldon sheldon/plugins.toml "sheldon source" zsh

# setting files
__load_configure "${ZDOTDIR}/rc"

# prompt
PROMPT='%F{green}%n%f%F{red}@%m%f %~ `__prompt_git`'$'\n$ '
RPROMPT="%T"

# profiling
command -v zprof &> /dev/null && zprof || true
