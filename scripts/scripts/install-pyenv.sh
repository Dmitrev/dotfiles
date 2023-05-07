#!/usr/bin/zsh

INSTALL_DIR=~/deps/pyenv

test ! -d $INSTALL_DIR && mkdir -p $INSTALL_DIR

git clone https://github.com/pyenv/pyenv.git $INSTALL_DIR

ln -s "${INSTALL_DIR}/bin/pyenv" ~/bin/pyenv
