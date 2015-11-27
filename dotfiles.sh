#!/usr/bin/env bash

SRC_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd ${SRC_DIR}

link_unless_exists(){
  if [ ! -e ${HOME}/${2} ]; then
    echo "Linking $2..."
    ln -sf ${SRC_DIR}/dotfiles/${1} ${HOME}/${2}
  fi
}

link_unless_exists "bash_profile.sh"  ".bash_profile"
link_unless_exists "bashrc.sh"        ".bashrc"
link_unless_exists "global.gitconfig" ".gitconfig"
link_unless_exists "global.gitignore" ".gitignore-global"
link_unless_exists "vimrc.vim"        ".vimrc"
