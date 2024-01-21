#!/usr/bin/env sh
DIR=$(dirname $(dirname "$0"))
ln -sn "${DIR}/config/bash/.bash_profile" "${HOME}/.bash_profile"
ln -sn "${DIR}/config/bash/.bashrc" "${HOME}/.bashrc"
ln -sn "${DIR}/config" "${HOME}/.config"
ln -sn "${DIR}/.zshenv" "${HOME}/.zshenv"
