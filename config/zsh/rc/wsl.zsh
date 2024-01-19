if [ -d /mnt/c ]; then

  # link cmd
  if [ ! -L /usr/local/bin/cmd ]; then
    sudo ln -s "/mnt/c/windows/system32/cmd.exe" "/usr/local/bin/cmd"
  fi
  
  # link firefox
  ffx="/mnt/c/Program Files/Mozilla Firefox/firefox.exe"
  if [ ! -L /usr/local/bin/firefox ]; then
    if [ -f "$ffx" ]; then
      sudo ln -s "$ffx" "/usr/local/bin/firefox"
    fi
  fi

  # link vscode
  if [ ! -L /usr/local/bin/code ]; then
    cd /mnt/c
    userprofile=$(cmd /C echo %USERPROFILE% | tr -d '\r')
    cd
    fd=$(echo "$userprofile" | awk -F'\\' '{print $NF}')
    code="/mnt/c/Users/$fd/AppData/Local/Programs/Microsoft VS Code/bin/code"
    sudo ln -s "$code" "/usr/local/bin/code"
  fi
  
fi