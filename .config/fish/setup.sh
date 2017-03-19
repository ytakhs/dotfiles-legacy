#!/bin/sh
ASDF_DIR="$HOME/.asdf"

ln -snf $HOME/dotfiles/.config/fish $HOME/.config/

if [ ! -d $ASDF_DIR ]; then
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1
fi

if [ ! -d ~/.config/fish/completions/asdf.fish ]; then
  cp ~/.asdf/completions/asdf.fish ~/.config/fish/completions
fi
