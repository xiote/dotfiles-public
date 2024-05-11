#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

echo "Install brew..."
if [[ $MACHINE == "Mac" ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Make sure we’re using the latest Homebrew.
    brew update

    # Upgrade any already-installed formulae.
    brew upgrade

elif [[ $MACHINE == "Linux" ]]; then
    exit 1
fi

# Symlink all dotfiles on Mac
##if [[ $MACHINE == "Mac" ]]; then
##fi

echo "Install karabiner..."
brew install --cask karabiner-elements

echo "Configure karabiner..."
./configure-karabiner.sh
