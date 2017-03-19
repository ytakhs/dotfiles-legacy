set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $HOME/.exenv/shims $PATH
set -x PATH $HOME/.rbenv/shims $PATH
rbenv init - | source

if [ -f "$HOME/.asdf/asdf.fish" ]
  source ~/.asdf/asdf.fish
end

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
    if string match -r "remotes\/" $branch > /dev/null
      set -l b (string replace -r 'remotes/origin/(.*)' '$1' $branch)
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

function peco_source_search
  ag $argv . | peco --exec 'awk -F : '"'"'{print "+" $2 " " $1}'"'"' | xargs less '
  commandline -f repaint
end

function pero
  peco_source_search
end

function fish_user_key_bindings
  bind \cx\cf peco_git_checkout
  bind \cr peco_select_history
  bind \cg peco_select_ghq_repo
  bind \cs peco_source_search
end
