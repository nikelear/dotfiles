#!/usr/bin/env sh

dfdir="${HOME}/dotfiles"
bkup="${HOME}/dot-evacuation"

for file in $(find "${dfdir}" -maxdepth 1 -name ".*"); do

  filename=$(basename "${file}")

  [ "${filename}" = ".git" ] && continue
  [ "${filename}" = ".gitignore" ] && continue
  
  if [ -d "${HOME}/${filename}" ] || [ -f "${HOME}/${filename}" ]; then
    if [ ! -L "${HOME}/${filename}" ]; then
      echo "make bkup"
      mkdir -p "${bkup}"
      mv "${HOME}/${filename}" "${bkup}/${filename}"
    else
      unlink "${HOME}/${filename}"
    fi
  fi
  echo "link ${file} to ${HOME}/${filename}"
  ln -snf "${file}" "${HOME}/${filename}"

done

if [ -d /mnt/c ]; then
  ln -s /mnt/c/Windows/System32/cmd.exe
fi
