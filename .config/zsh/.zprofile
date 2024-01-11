if [[ -e /etc/environment ]]; then
 while read -r line; do
   if [[ "$line" == *=* ]]; then
     export "$line"
   fi
 done < /etc/environment
fi


if [[ ":$PATH:" != *":$HOME/.cargo/bin:"* ]]; then
  fi

if [[ ":$PATH:" != *":$HOME/.config/bin:"* ]]; then
  export PATH="$HOME/.config/bin:$PATH"
fi