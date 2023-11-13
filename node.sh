SRC_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

NVM_VERSION="0.39.5"
NODE_DEFAULT="lts/hydrogen"

NODE_VERSIONS=(
  "lts/fermium"
  "lts/gallium"
  "lts/hydrogen"
)

echo "Setup nvm/Node..."
echo ""
echo "This will install:"
echo "  nvm v${NVM_VERSION}"

for i in "${NODE_VERSIONS[@]}"
do
  echo "  Node ${i}"
done

echo "This will also write load-nvmrc script into .zshrc if needed."
echo ""

# Install nvm
if [ -e ${HOME}/.nvm/nvm.sh ]; then
  echo "Skipping because nvm already exists. Run ./unnode.sh to remove it."
else

  # Install nvm if needed and source it.
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh | bash
fi

source ${HOME}/.nvm/nvm.sh

# Install each version of Node
for i in "${NODE_VERSIONS[@]}"
do
  echo "Install Node ${i}"
  nvm install $i

  # Set up user npm configuration
  npm config set depth 0
done

# Switch on the default Node and install all the global npm packages to it.
nvm alias default ${NODE_DEFAULT}
nvm use default