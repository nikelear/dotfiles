# setting files
ZSH_DIR="${HOME}/.config/zsh/rc"

if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
    for file in ${ZSH_DIR}/**/*.zsh; do
        [ -r $file ] && source $file
    done
fi

# plugin
eval "$(sheldon source)"

# starship
eval "$(starship init zsh)"

# profiling
if (which zprof > /dev/null 2>&1) ;then
  zprof
fi

