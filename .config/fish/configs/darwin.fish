# openssl
if [ -d "/opt/openssl/1.1.0g" ]
  set -x PATH "/opt/openssl/1.1.0g/bin" $PATH
end

# ruby
if which rbenv > /dev/null 2>&1 ;and [ -d "$HOME/.rbenv" ]
  set -x PATH $HOME/.rbenv/shims $PATH
  status --is-interactive && source (rbenv init -|psub)
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
if [ -d "$HOME/go" ]
  set -x PATH $HOME/go/bin $PATH
else
  echo "no $HOME/go :("
end
set -x GOPATH $HOME/dev
set -x PATH $GOPATH/bin $PATH

# python
# set -x PYENV_ROOT $HOME/.pyenv
if which pyenv > /dev/null
  status --is-interactive && source (pyenv init -|psub)
  if which pyenv-virtualenv-init > /dev/null
    status --is-interactive && source (pyenv virtualenv-init -|psub)
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

if which direnv > /dev/null 2>&1
  eval (direnv hook fish)
end
