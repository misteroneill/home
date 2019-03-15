#!/usr/bin/env bash

NVM_VERSION="0.34.0"
NODE_DEFAULT="lts/dubnium"

NODE_VERSIONS=(
  "lts/argon"
  "lts/dubnium"
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

    # Set up user npm configuration
    npm config set depth 0
  done

  # Switch on the default Node and install all the global npm packages to it.
  nvm alias default ${NODE_DEFAULT}
  nvm use default

fi
