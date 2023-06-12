#!/usr/bin/env zsh

cd $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
./undotfiles.sh
./unnode.sh
