#!/bin/bash

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
        fi
    else
        ln -snf "${file}" "${HOME}/${filename}"
    fi

done
