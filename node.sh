#!/usr/bin/env bash

NVM_VERSION="0.29.0"
NODE_DEFAULT="0.10"

NODE_VERSIONS=(
  "0.10"
  "4"
  "5"
)

declare -A NPM_VERSIONS
NPM_VERSIONS["0.10"]="2.x.x"
NPM_VERSIONS["4"]="2.x.x"
NPM_VERSIONS["5"]="3.x.x"

NPM_PACKAGES=(
  "babel@5"
  "browserify"
  "documentation"
  "eslint"
  "grunt-cli"
  "gulp"
  "karma-cli"
  "mocha"
  "node-sass"
  "uglifyjs"
  "watch"
  "watchify"
  "yo"
)

echo "Setup nvm/Node/npm..."

if [ -e ${HOME}/.nvm/nvm.sh ]; then
  echo "Skipping because nvm already exists. Run ./unnode.sh to remove it."
else

  # Install nvm if needed and source it.
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v${NVM_VERSION}/install.sh | bash
  source ${HOME}/.nvm/nvm.sh

  # Install each version of Node and update its npm.
  for i in "${NODE_VERSIONS[@]}"
  do
    nvm install $i
    npm i -g npm@${NPM_VERSIONS[$i]}
  done

  # Switch on the default Node and install all the global npm packages to it.
  nvm alias default ${NODE_DEFAULT}
  nvm use default
  npm i -g ${NPM_PACKAGES[@]}

  # Set up user npm configuration
  npm config set depth 0
fi
