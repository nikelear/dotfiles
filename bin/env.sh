#!/bin/bash

confirm_execution() {
    echo "Do you want to install '$1'? [Y/n]"
    read answer
    if [[ $answer = Y ]] || [[ $answer = y ]] || [[ -z $answer ]]; then
        return 0  # return true
    else
        return 1  # return false
    fi
}

if confirm_execution "brew"; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if confirm_execution "mise"; then
    curl https://mise.run | sh
    $HOME/.local/bin/mise install
fi