# dotfiles

## atom
```sh
brew install caskroom/cask/brew-cask
brew cask install atom
ln -snf $HOME/dotfiles/.atom $HOME/
```

## fish-shell
```sh
brew install fish
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher
dotfiles/.config/fish/setup.sh
```
