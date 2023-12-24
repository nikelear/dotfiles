zmodload zsh/zprof && zprof

export EDITOR=vim

export RSYNC_RSH=ssh

export ZDOTDIR="$HOME/.config/zsh"

if [[ -e /etc/environment ]]; then
 while read -r line; do
   if [[ "$line" == *=* ]]; then
     export "$line"
   fi
 done < /etc/environment
fi


if [[ ":$PATH:" != *":$HOME/.cargo/bin:"* ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

if [[ ":$PATH:" != *":$HOME/.config/bin:"* ]]; then
  export PATH="$HOME/.config/bin:$PATH"
fi
