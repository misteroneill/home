#!/usr/bin/env zsh

cd $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
./dotfiles.sh
./node.sh
echo "Install finished! Make sure you: source ~/.zshrc"
