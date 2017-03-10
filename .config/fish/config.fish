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

function peco_git_checkout
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

function peco_select_ghq_repo
  ghq list | peco | read repo
  if [ $repo ]
    ghq root | read ghq_dir
    cd $ghq_dir/$repo
  end
  commandline -f repaint
end

function fish_user_key_bindings
  bind \cx\cf peco_git_checkout
  bind \cr peco_select_history
  bind \cg peco_select_ghq_repo
end
