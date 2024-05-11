#!/bin/bash

# if ! [ -f ~/Library/KeyBindings/DefaultkeyBinding.dict ]; then mkdir -p ~/Library/KeyBindings && echo '{"₩" = ("insertText:", "\`");}' > ~/Library/KeyBindings/DefaultkeyBinding.dict; fi

mkdir -p "$HOME/Library/KeyBindings"
cp "$PWD/dotfiles/DefaultkeyBinding.dict" "$HOME/Library/KeyBindings"

mkdir -p "$HOME/.config/karabiner"
cp "$PWD/dotfiles/karabiner.json" "$HOME/.config/karabiner"
