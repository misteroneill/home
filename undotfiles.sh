#!/usr/bin/env zsh

rm_if_exists(){
  if [ -L ${HOME}/${1} ]; then
    echo "Removing $1..."
    rm ${HOME}/${1}
  fi
}

rm_if_exists ".gitconfig"
rm_if_exists ".gitignore"
rm_if_exists ".vimrc"
