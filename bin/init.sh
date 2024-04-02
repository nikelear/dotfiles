#!/usr/bin/env sh

# for git bash
if [ ! -z "${MSYS}" ] && [[ ! "${MSYS}" == *"winsymlinks:nativestrict"* ]]; then
  export MSYS="${MSYS} winsymlinks:nativestrict"
  mkdir -p "${HOME}/.config"
fi

# symbolic links
DIR=$(dirname $(cd $(dirname $0) && pwd))
slink () {
  if [ -e $2 ]; then
    mkdir -p "${HOME}/bkup"
    mv $2 "${HOME}/bkup/"$(basename $2)
  fi
  ln -snf $1 $2
}
if [ "${DIR}" != "/usr" ]; then
  slink "${DIR}/vim" "${HOME}/.vim"
  slink "${DIR}/config" "${HOME}/.config"
  slink "${DIR}/config/bash/.bash_profile" "${HOME}/.bash_profile"
  slink "${DIR}/config/bash/.bashrc" "${HOME}/.bashrc"
  slink "${DIR}/config/zsh/.zshenv" "${HOME}/.zshenv"
else
  echo "Run directly,please"
fi

# for wsl
if [ -d /mnt/c/windows ]; then

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
    userprofile=$(cd /mnt/c && cmd /C echo %USERPROFILE% | tr -d '\r')
    fd=$(echo "$userprofile" | awk -F'\\' '{print $NF}')
    code="/mnt/c/Users/$fd/AppData/Local/Programs/Microsoft VS Code/bin/code"
    sudo ln -s "$code" "/usr/local/bin/code"
  fi
  
fi