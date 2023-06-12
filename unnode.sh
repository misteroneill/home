#!/usr/bin/env zsh

echo "Remove nvm and all Node/npm versions..."

if [ -d ${HOME}/.nvm ]; then
  rm -rf ${HOME}/.nvm
  nvm unload
fi
