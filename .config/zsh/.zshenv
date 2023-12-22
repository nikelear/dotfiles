
export ZDOTDIR="$HOME/.config/zsh"

if [[ -e /etc/environment ]]; then
 while read -r line; do
   if [[ "$line" == *=* ]]; then
     export "$line"
   fi
 done < /etc/environment
fi