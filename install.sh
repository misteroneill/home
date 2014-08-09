#!/bin/bash

# Dependencies: git

# Have to check if this one exists otherwise any subsequent calls to
# install.sh will create recursive links. This isn't harmful, but it's
# also not desirable. :)
if [ ! -L ${HOME}/.bash ]
  then
    ln -sf ${PWD}/_bash ${HOME}/.bash
fi

ln -sf ${PWD}/_bash_profile ${HOME}/.bash_profile
ln -sf ${PWD}/_bashrc ${HOME}/.bashrc
ln -sf ${PWD}/_gitconfig ${HOME}/.gitconfig
ln -sf ${PWD}/_gitignore_global ${HOME}/.gitignore_global
ln -sf ${PWD}/_vimrc ${HOME}/.vimrc

# set up Vundle if needed
mkdir -p ${HOME}/.vim/bundle

vundle=${HOME}/.vim/bundle/Vundle.vim
if [ ! -d $vundle ]
  then
    git clone https://github.com/gmarik/Vundle.vim.git $vundle
fi

