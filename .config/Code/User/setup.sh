#!/bin/sh

set -ex

case "$(uname)" in
  "Darwin" ) VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User" ;;
esac

CURRENT_DIR=$(pwd)

ln -sf "$CURRENT_DIR/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"
ln -sf "$CURRENT_DIR/settings.json" "$VSCODE_USER_DIR/settings.json"

cat extensions.txt | xargs -I{} code --install-extension {}
