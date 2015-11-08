#!/usr/bin/env bash

rm_if_exists(){
  if [ -e ${HOME}/${1} ]; then
    echo "Removing $1..."
    rm ${HOME}/${1}
  fi
}

rm_if_exists .bash_profile
rm_if_exists .bashrc
rm_if_exists .gitconfig
rm_if_exists .gitignore-global
rm_if_exists .vimrc
