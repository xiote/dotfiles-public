# You may need to manually set your language environment
export LANG=ko_KR.UTF-8
export LC_ALL=ko_KR.UTF-8

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Plugins
# plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
  git
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    CYGWIN*)    MACHINE=Cygwin;;
    MINGW*)     MACHINE=MinGw;;
    *)          MACHINE="UNKNOWN:${unameOut}"
esac
export MACHINE

CPU="$(uname -m)"
export CPU

# Source aliases
# For a full list of active aliases, run `alias`.
if [[ "$MACHINE" == "Linux" ]];then
  # PROJECT_ROOT='/root/dotfiles'
  PROJECT_ROOT='/home/xiote/dotfiles'
  source "$PROJECT_ROOT/env/aliases-shared.sh"
  source "$PROJECT_ROOT/env/aliases-linux.sh"
  source "$PROJECT_ROOT/env/exports.sh"
  source "$PROJECT_ROOT/env/functions.sh"
elif [[ "$MACHINE" == "Mac" ]]; then
  PROJECT_ROOT='/Users/xiote/dotfiles'
  source "$PROJECT_ROOT/env/aliases-shared.sh"
  source "$PROJECT_ROOT/env/aliases-mac.sh"
  source "$PROJECT_ROOT/env/exports.sh"
  source "$PROJECT_ROOT/env/functions.sh"
fi

