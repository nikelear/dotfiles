#!/usr/bin/env bash
set -ue

# スクリプトのディレクトリを取得
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
dotdir=$(dirname "${script_dir}")

if [[ "$HOME" != "$dotdir" ]]; then
  for f in "${dotdir}"/.??*; do
    filename=$(basename "${f}")
    [[ "${filename}" == ".git" ]] && continue
    [[ "${filename}" == ".bin" ]] && continue
    [[ "${filename}" == ".bin.local" ]] && continue
    [[ "${filename}" == ".gitignore" ]] && continue

    # delete link
    if [[ -L "${HOME}/${filename}" ]]; then
      rm -f "${HOME}/${filename}"
    fi

    # create backup
    if [[ -e "${HOME}/${filename}" ]]; then
      if [[ ! -d "${HOME}/.dotbackup" ]]; then
        echo "Needed to back up a file; created missing dotbackup in HOME." >&2
        mkdir "${HOME}/.dotbackup"
      fi
      mv "${HOME}/${filename}" "${HOME}/.dotbackup/"
    fi

    # make link
    ln -snf "${f}" "${HOME}"
  done
else
  echo "Installation source and destination are identical." >&2
fi

git config --global include.path "~/.gitconfig.local"
echo -e "\e[1;36m Install completed!!!! \e[m"
