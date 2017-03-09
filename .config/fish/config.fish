set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $HOME/.exenv/shims $PATH
set -x PATH $HOME/.rbenv/shims $PATH
rbenv init - | source

# bobthefish
set -g theme_display_date no
set -g theme_color_scheme solarized-dark

# peco
function peco
  command peco --layout=bottom-up $argv
end
function peco-git-checkout
  git branch -a | peco | tr -d ' ' | read branch
  echo $branch
  if [ $branch ]
    if contains $branch "remotes/"
      set -l b (echo $branch | awk -F'/' '{print $3}')
      git checkout -b $b $branch
    else
      git checkout $branch
    end
  end
  commandline -f repaint
end

bind \cx\cr peco-git-checkout
