

# setting files
ZSH_DIR="${HOME}/.config/zsh/rc"

if [ -d $ZSH_DIR ] && [ -r $ZSH_DIR ] && [ -x $ZSH_DIR ]; then
    for file in ${ZSH_DIR}/**/*.zsh; do
        [ -r $file ] && source $file
    done
fi

# plug-in
eval "$(sheldon source)"

# starship
eval "$(starship init zsh)"