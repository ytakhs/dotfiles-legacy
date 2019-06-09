#!/bin/sh

set -ex

function check_dir_exists() {
  dir_path="$1"

  if !(test -d "$dir_path"); then
    echo "no such dir $dir_path" >&2
    exit 1
  fi
}

function check_command_exists() {
  command_name="$1"

  if !(which "$command_name" > /dev/null 2>&1); then
    echo "no such command $command_name" >&2
    exit 1
  fi
}

export XDG_CONFIG_HOME="${HOME}/.config"
case "$(uname)" in
  "Darwin" ) VSCODE_USER_DIR="${HOME}/Library/Application Support/Code/User" ;;
  * ) echo "not supported" >&2; exit 1 ;;
esac

check_dir_exists "$XDG_CONFIG_HOME"
check_dir_exists "$VSCODE_USER_DIR"
check_command_exists "curl"
check_command_exists "code"

## fish
ln -snf "${CURRENT_DIR}/.config/fish" "${XDG_CONFIG_HOME}/fish"
curl "https://git.io/fisher" --create-dirs -sLo "$XDG_CONFIG_HOME/fish/functions/fisher.fish"
fisher install

## VSCode
ln -snf "${CURRENT_DIR}/.config/Code/User/keybindings.json" "${VSCODE_USER_DIR}/keybindings.json"
ln -snf "${CURRENT_DIR}/.config/Code/User/settings.json" "${VSCODE_USER_DIR}/settings.json"
cat "${CURRENT_DIR}/.config/Code/User/extensions.txt" | xargs -I{} code --install-extension {}

## vim
ln -snf "${CURRENT_DIR}/.vimrc" "${HOME}/.vimrc"

## git
ln -snf "${CURRENT_DIR}/.gitconfig" "$HOME/.gitconfig"
ln -snf "${CURRENT_DIR}/.gitignore_global" "$HOME/.gitignore_global"

## tic
ln -snf "${CURRENT_DIR}/.tigrc" "$HOME/.tigrc"

## pry
ln -snf "${CURRENT_DIR}/.pryrc" "$HOME/.pryrc"

echo "DONE!"
