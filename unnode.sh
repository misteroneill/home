#!/usr/bin/env bash

echo "Remove nvm and all Node/npm versions..."

if [ -d ${HOME}/.nvm ]; then
  nvm unload
  rm -rf ${HOME}/.nvm
fi
