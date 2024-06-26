#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

echo "Install vim..."
if [[ $MACHINE == "Mac" ]]; then

	brew install python3
	brew install vim

elif [[ $MACHINE == "Linux" ]]; then
        sudo add-apt-repository ppa:jonathonf/vim
        sudo apt update 
        sudo apt install -y vim
        sudo apt install -y vim-gtk3 vim-nox
fi

echo "Configure vim..."
./configure-vim.sh
