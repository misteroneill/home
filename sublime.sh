#!/usr/bin/env zsh

cd $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

node sublime/install.js

sudo mkdir -p /usr/local/bin
sudo ln -sf "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" "/usr/local/bin/subl"
sudo ln -sf "$(pwd)/sublime/sublp.sh" "/usr/local/bin/sublp"
