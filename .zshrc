# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt extended_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_reduce_blanks
setopt hist_expand

bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/jit-y/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

function peco() {
  command peco --layout=bottom-up "$@"
}

function peco_ghq_selection() {
  buf="$(ghq list --full-path | peco)"

  if [[ ! -z $buf ]]; then
    cd $buf
    zle accept-line
  fi

  zle reset-prompt
}

zle -N peco_ghq_selection
bindkey '^g' peco_ghq_selection

eval "$(starship init zsh)"
