#!/usr/bin/env bash

cd $(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
./undotfiles.sh
./unnode.sh
