#!/bin/bash

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac

CPU="$(uname -m)"

export VERSION="1.22.3"
echo "Install go..."
if [[ $MACHINE == "Mac" ]]; then
	if [[ $CPU == "x86_64" ]]; then
	    curl -O https://dl.google.com/go/go${VERSION}.darwin-amd64.tar.gz
	    sudo rm -rvf /usr/local/go/
	    sudo tar -C /usr/local -xzf go${VERSION}.darwin-amd64.tar.gz
	    rm go${VERSION}.darwin-amd64.tar.gz
	    echo "To run anywhere,"
	    echo "  sudo add '/usr/local/go/bin' to /etc/paths"
	elif [[ $CPU == "arm64" ]]; then
	    curl -O https://dl.google.com/go/go${VERSION}.darwin-arm64.tar.gz
	    sudo rm -rvf /usr/local/go/
	    sudo tar -C /usr/local -xzf go${VERSION}.darwin-arm64.tar.gz
	    rm go${VERSION}.darwin-arm64.tar.gz
	    echo "To run anywhere, add '/usr/local/go/bin' to /etc/paths"
	    echo "  sudo vim /etc/paths"
	fi
elif [[ $MACHINE == "Linux" ]]; then
	if [[ $CPU == "x86_64" ]]; then
	    curl -O https://dl.google.com/go/go${VERSION}.linux-amd64.tar.gz
	    sudo rm -rvf /usr/local/go/
	    sudo tar -C /usr/local -xzf go${VERSION}.linux-amd64.tar.gz
	    rm go${VERSION}.linux-amd64.tar.gz
	    echo "To run anywhere, add path '/usr/local/go/bin'"
	    echo "  sudo vi $HOME/.profile"
	    echo "  logout"
	elif [[ $CPU == "aarch64" ]]; then
	    wget http://mirror.archlinuxarm.org/aarch64/extra/go-2%3A1.21.6-1-aarch64.pkg.tar.xz
	    sudo rm -rvf /usr/local/go/
	    sudo tar -C / -xvf ./go-2:1.21.6-1-aarch64.pkg.tar.xz
	    echo "To run anywhere, add path '/usr/local/go/bin'"
	    echo "  sudo vi $HOME/.profile"
	    echo "  logout"
	fi

fi
