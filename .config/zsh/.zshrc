export PATH="$HOME/.local/bin:$PATH"

HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000
setopt NOBEEP
setopt EXTENDED_HISTORY
setopt APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_SAVE_NO_DUPS
setopt HIST_VERIFY
setopt SHARE_HISTORY

zsh_completions_dir="$HOME/.zsh/zsh-completions"
zsh_syntax_highlighting_dir="$HOME/.zsh/zsh-syntax-highlighting"
zsh_autosuggestions_dir="$HOME/.zsh/zsh-autosuggestions"

fpath=("${zsh_completions_dir}/src" $fpath)
source "${zsh_syntax_highlighting_dir}/zsh-syntax-highlighting.zsh"
source "${zsh_autosuggestions_dir}/zsh-autosuggestions.zsh"

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

eval "$(oh-my-posh --init --shell zsh --config ~/.poshthemes/hotstick.minimal.omp.json)"
