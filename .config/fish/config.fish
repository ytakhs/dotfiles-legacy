set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $HOME/.exenv/shims $PATH

if [ -f "$HOME/.asdf/asdf.fish" ]
  source ~/.asdf/asdf.fish
end

set -x PATH $HOME/.rbenv/shims $PATH
rbenv init - | source

# bobthefish
set -g theme_display_date no
set -g theme_color_scheme solarized-dark

function fish_user_key_bindings
  bind \cx\cf peco_git_checkout
  bind \cr peco_select_history
  bind \cg peco_select_ghq_repo
  bind \cs peco_source_search
end
