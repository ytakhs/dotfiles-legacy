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

## OCaml
```console
$ brew install opam hg darcs rlwrap
$ opam init
$ ln -sf ~/dotfiles/.ocamlinit ~/
```

```fish
1 set -gx PATH ~/.opam/system/bin $PATH;
4 set -gx MANPATH "$MANPATH" ~/.opam/system/man;
```

## Google Cloud SDK
```console
$ curl https://sdk.cloud.google.com | bash
```
