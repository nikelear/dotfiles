if [ -d "$HOME/.cargo" ]; then
  . "$HOME/.cargo/env"
fi

if command -v sheldon &> /dev/null; then
  eval "$(sheldon source)"
fi