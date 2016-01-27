#!/usr/bin/env bash

if [ $(uname) = "Darwin" ]; then
  IS_MAC=true
fi

if [ $IS_MAC ]; then
  echo "Install Homebrew..."

  if [ ! `which git` ]; then
    echo "Did not detect Git, so we may need to install Xcode Command Line Tools..."
    xcode-select --install
  fi

  if [ `which git` ]; then

    # If it's absent, install Homebrew and some programs. Some of this is
    # inspired by https://github.com/kangax/osx/
    if [ `which brew` ]; then
      echo "Skipping Homebrew, it's already installed..."
    else
      echo "Installing Homebrew and programs..."
      ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      brew update

      # Install GNU coreutils. These are overridden on the $PATH in _bashrc.
      brew install coreutils

      # Install GNU grep.
      brew tap homebrew/dupes
      brew install --with-default-names homebrew/dupes/grep

      BREW_PACKAGES=(
        "git"
        "wget"
        "https://raw.githubusercontent.com/puffnfresh/toggle-osx-shadows/master/homebrew/toggle-osx-shadows.rb"
      )

      brew install ${BREW_PACKAGES[@]}
      brew cleanup
      toggle-osx-shadows
    fi
  fi
fi
