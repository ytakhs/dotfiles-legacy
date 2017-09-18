# nodebrew
if [ -d "$HOME/.nodebrew" ]
  set -x PATH $HOME/.nodebrew/current/bin $PATH
else
  echo "no nodebrew:("
end

# erlang
if [ -d ~/erlang/20.0/ ]
  source ~/erlang/20.0/activate.fish
  set -x ERL_AFLAGS "-kernel shell_history enabled"
else
  echo "no kerl:("
end

# elixir
if which exenv > /dev/null 2>&1 ;and [ -d "$HOME/.exenv" ]
  set -x PATH $HOME/.exenv/shims $PATH
else
  echo "no exenv:("
end

# ruby
if which rbenv > /dev/null 2>&1 ;and [ -d "$HOME/.rbenv" ]
  set -x PATH $HOME/.rbenv/shims $PATH
  status --is-interactive; and source (rbenv init -|psub)
else
  echo "no rbenv:("
end

# rust
if [ -f ~/.cargo/env ]
  set -x PATH $HOME/.cargo/bin $PATH
else
  echo "no cargo:("
end

# go
if which goenv > /dev/null 2>&1 ;and [ -d "$HOME/.goenv" ]
  set -x PATH $HOME/.goenv/shims $PATH
  goenv init - | source
else
  echo "no goenv:("
end
set -x GOPATH $HOME/dev
set -x PATH $GOPATH/bin $PATH
set -x GHQ_ROOT $GOPATH/.ghq/

# ocaml
if which opam > /dev/null 2>&1; and [ -d ~/.opam ]
  source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
  if which rlwrap > /dev/null 2>&1
    alias ocaml="rlwrap ocaml"
  end
else
  echo "no opam:("
end
set -x NVIM_PYTHON_LOG_FILE $HOME/.nvimlog

# python
# set -x PYENV_ROOT $HOME/.pyenv
if which pyenv > /dev/null
  status --is-interactive; and source (pyenv init -|psub)
  if which pyenv-virtualenv-init > /dev/null
    status --is-interactive; and source (pyenv virtualenv-init -|psub)
  else
    echo 'no pyenv-virtualenv :('
  end
else
  echo 'no pyenv :('
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f ~/google-cloud-sdk/path.fish.inc ]
  if type source > /dev/null
    source ~/google-cloud-sdk/path.fish.inc
  else
    . ~/google-cloud-sdk/path.fish.inc
  end;
else
  echo "no google-cloud-sdk:("
end

if [ -d "/usr/local/share/git-core/contrib/diff-highlight" ]
  set -x PATH "/usr/local/share/git-core/contrib/diff-highlight" $PATH
else
  echo "no diff-highlight"
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
end
#
# if which conda > /dev/null 2>&1 ;
#   source (conda info --root)/etc/fish/conf.d/conda.fish
# else
#   echo "no conda :("
# end
set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
