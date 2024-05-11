#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

sudo rm -rf ~/.vim
sudo rm -rf ~/.vimrc
sudo rm -rf ~/.tidyrc

git clone --recursive https://github.com/xiote/dotvim ~/.vim

# vim-prettier Prettier: no prettier executable installation found
echo "Install nodejs..."
if [[ $MACHINE == "Mac" ]]; then
	brew install nodejs
elif [[ $MACHINE == "Linux" ]]; then
	# curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash - &&\
	# sudo apt-get install -y nodejs
	#
	sudo apt update
	sudo apt install nodejs
	sudo apt install npm
fi

cd ~/.vim/pack/plugins/start/vim-prettier
npm install
