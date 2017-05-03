# nodebrew
if [ -d "$HOME/.nodebrew" ]
  set -x PATH $HOME/.nodebrew/current/bin $PATH
else
  echo "nodebrew is not installed"
end

# exenv
if which exenv > /dev/null 2>&1 ;and [ -d "$HOME/.exenv" ]
  set -x PATH $HOME/.exenv/shims $PATH
else
  echo "exenv is not installed"
end

# asdf
if [ -f "$HOME/.asdf/asdf.fish" ]
  source ~/.asdf/asdf.fish
else
  echo "asdf is not installed"
end

# rbenv
if which rbenv > /dev/null 2>&1 ;and [ -d "$HOME/.rbenv" ]
  set -x PATH $HOME/.rbenv/shims $PATH
  rbenv init - | source
else
  echo "rbenv is not installed."
end

# goenv
if which goenv > /dev/null 2>&1 ;and [ -d "$HOME/.goenv" ]
  set -x PATH $HOME/.goenv/shims $PATH
  goenv init - | source
else
  echo "goenv is not installed"
end

# bobthefish
set -g theme_display_date no
set -g theme_color_scheme solarized-dark

function fish_user_key_bindings
  bind \cx\cf peco_git_checkout
  bind \cr peco_select_history
  bind \cg peco_select_ghq_repo
  bind \cs peco_source_search
end
