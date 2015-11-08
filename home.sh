#!/usr/bin/env bash

SRC_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd ${SRC_DIR}

link_unless_exists(){
  if [ ! -e ${HOME}/${2} ]; then
    echo "Linking $2..."
    ln -sf ${SRC_DIR}/${1} ${HOME}/${2}
  fi
}

link_unless_exists _bash_profile.sh .bash_profile
link_unless_exists _bashrc.sh .bashrc
link_unless_exists _gitconfig .gitconfig
link_unless_exists _gitignore-global .gitignore-global
link_unless_exists _vimrc.vim .vimrc
