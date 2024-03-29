switch (uname)
case Darwin
  source $HOME/.config/fish/configs/darwin.fish
case Linux
  source $HOME/.config/fish/configs/linux.fish
case '*'
  echo "not supported"
end

if [ -f "$HOME/.config/fish/configs/custom.fish" ]
  echo "load custom.fish"
  source "$HOME/.config/fish/configs/custom.fish"
end

# bobthefish
set -g theme_display_date no
set -g theme_color_scheme solarized-dark
set -g theme_display_virtualenv no
set -g theme_display_cmd_duration no

function fish_user_key_bindings
  bind \cx\cf peco_git_checkout
  bind \cxf peco_git_checkout
  bind \cg peco_select_ghq_repo
end
