# nodebrew
if [ -d "$HOME/.nodebrew" ]
  set -x PATH $HOME/.nodebrew/current/bin $PATH
else
  echo "no nodebrew:("
end

# elixir
if which exenv > /dev/null 2>&1 ;and [ -d "$HOME/.exenv" ]
  set -x PATH $HOME/.exenv/shims $PATH
else
  echo "no exenv:("
end

if [ -d "/opt/elixir" ]
  set -x PATH /opt/elixir/bin $PATH
else
  echo "no elixir :("
end

# erlang
if [ -d "/opt/erlang/20.2.1" ]
  set -x PATH /opt/erlang/20.2.1/bin $PATH
  if [ -d "$HOME/.cache/rebar3" ]
    set -x PATH "$HOME/.cache/rebar3/bin" $PATH
  end
else
  echo "no erlang :("
end

# openssl
if [ -d "/opt/openssl/1.1.0g" ]
  set -x PATH "/opt/openssl/1.1.0g/bin" $PATH
end

# ruby
if which rbenv > /dev/null 2>&1 ;and [ -d "$HOME/.rbenv" ]
  set -x PATH $HOME/.rbenv/shims $PATH
  status --is-interactive; and source (rbenv init -|psub)
else
  echo "no rbenv:("
end

# rust
if [ -f $HOME/.cargo/env ]
  set -x PATH $HOME/.cargo/bin $PATH
  set -x RUST_SRC_PATH $HOME/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src
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

# ocaml
if which opam > /dev/null 2>&1; and [ -d $HOME/.opam ]
  source $HOME/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
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
if [ -f $HOME/google-cloud-sdk/path.fish.inc ]
  if type source > /dev/null
    source $HOME/google-cloud-sdk/path.fish.inc
  else
    . $HOME/google-cloud-sdk/path.fish.inc
  end;
else
  echo "no google-cloud-sdk:("
end

if [ -d "/usr/local/share/git-core/contrib/diff-highlight" ]
  set -x PATH "/usr/local/share/git-core/contrib/diff-highlight" $PATH
else
  echo "no diff-highlight"
end

if [ -d /opt/flutter ]
  set -x PATH "/opt/flutter/bin" $PATH
end

set -g fish_user_paths "/usr/local/opt/llvm/bin" $fish_user_paths
