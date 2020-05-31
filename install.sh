#!/usr/bin/env bash

cd $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
./brew.sh
./dotfiles.sh
./node.sh
# ./sublime.sh
echo "Install finished! Make sure you: source ~/.bashrc"
