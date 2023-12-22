
if [[ ":$PATH:" != *":$HOME/.cargo/bin:"* ]]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

if [[ ":$PATH:" != *":$HOME/.config/bin:"* ]]; then
  export PATH="$HOME/.config/bin:$PATH"
fi
