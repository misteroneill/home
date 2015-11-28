#!/usr/bin/env bash

cd $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

babel-node sublime/install.js

# Symlink binaries...
sudo mkdir -p /usr/local/bin

if [ $(uname) = "Darwin" ]; then
  sudo ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "/usr/local/bin/subl"
fi

sudo ln -sf "$(pwd)/sublime/sublp.sh" "/usr/local/bin/sublp"
