#!/usr/bin/env sh
DIR=$(dirname $(cd $(dirname $0) && pwd))
ln -snf "${DIR}/config/bash/.bash_profile" "${HOME}/.bash_profile"
ln -snf "${DIR}/config/bash/.bashrc" "${HOME}/.bashrc"
ln -snf "${DIR}/config" "${HOME}/.config"
ln -snf "${DIR}/.zshenv" "${HOME}/.zshenv"
