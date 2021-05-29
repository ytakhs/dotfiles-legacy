HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

setopt nobeep

export PATH="$HOME/.local/bin:$PATH"

eval "$(oh-my-posh --init --shell zsh --config ~/.poshthemes/hotstick.minimal.omp.json)"

source ~/.zinit/bin/zinit.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions

function peco-ghq-select() {
  local selected_dir=$(ghq list --full-path | peco --layout=bottom-up --query "$LBUFFER")
  if [[ -n "$selected_dir" ]]; then
    cd "${selected_dir}"
    zle accept-line
  fi
}
zle -N peco-ghq-select

function peco-git-switch() {
  local selected_branch="$(git branch | peco --layout=bottom-up | tr -d ' ')"

  if [[ -n "$selected_branch" ]]; then
    git switch "$selected_branch"
    zle accept-line
  fi
}
zle -N peco-git-switch

bindkey '^g' peco-ghq-select
bindkey '^xf' peco-git-switch
