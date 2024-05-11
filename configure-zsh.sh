#!/bin/bash

# Check default shell
if [[ $SHELL != "/usr/bin/zsh" && $SHELL != "/bin/zsh" ]]; then
    echo "Confirm zsh"
    echo "  chsh -s /usr/bin/zsh xiote"    
    echo "  logout"
    exit
fi

# Detect machine
unameOut="$(uname -s)"
case "${unameOut}" in
  Linux*)     MACHINE=Linux;;
  Darwin*)    MACHINE=Mac;;
  CYGWIN*)    MACHINE=Cygwin;;
  MINGW*)     MACHINE=MinGw;;
  *)          MACHINE="UNKNOWN:${unameOut}"
esac


if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "Install Oh-My-Zsh"
  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

    # Assumes default ZSH installation
    ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"

    # Installs plugins
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

fi


# Copy .zshrc
echo "Copy .zshrc"
cp -p "$PWD/dotfiles/.zshrc" "$HOME"

echo "Source zshrc, if you want to apply this shell."
echo "  source ~/.zshrc"
