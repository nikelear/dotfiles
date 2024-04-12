if [ -d /home/linuxbrew ]; then 
  if [ ! -e ~/.cache/brew.bash ]; then
    echo "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" > ~/.cache/brew.bash
  fi
  source ~/.cache/brew.bash
fi
