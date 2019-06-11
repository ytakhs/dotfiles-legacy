switch (uname)
case Darwin
  source $HOME/.config/fish/configs/darwin.fish
case '*'
  echo "not supported"
end

if [ -f "$HOME/.config/fish/configs/individual.fish" ]
  echo "load individual.fish"
  source "$HOME/.config/fish/configs/individual.fish"
end

# bobthefish
set -g theme_display_date no
set -g theme_color_scheme solarized-dark
set -g theme_display_virtualenv no
set -g theme_display_cmd_duration no

function fish_user_key_bindings
  bind \cx\cf peco_git_checkout
  bind \cr peco_select_history
  bind \cg peco_select_ghq_repo
  bind \cs peco_source_search
  bind \cc\cs peco_ssh
end
