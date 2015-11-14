#!/usr/bin/env bash

cd $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
./brew.sh
./home.sh
./node.sh
./sublime.js
echo "Install finished! Make sure you: source ~/.bashrc"
