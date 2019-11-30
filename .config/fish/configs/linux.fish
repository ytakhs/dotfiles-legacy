set -x GOPATH $HOME/dev
set -x PATH $GOPATH/bin $PATH
set -x EDITOR vim

# rust
if [ -f $HOME/.cargo/env ]
  set -x fish_user_paths $HOME/.cargo/bin $fish_user_paths
else
  echo "no cargo :("
end

if [ -d $HOME/.rbenv ]
  set -x fish_user_paths $HOME/.rbenv/bin $fish_user_paths
  status --is-interactive && source (rbenv init -|psub)
else
  echo "no rbenv :("
end

if [ -d $HOME/dev/opt/flutter ]
  set -x fish_user_paths $HOME/dev/opt/flutter/bin $fish_user_paths
else
  echo "no flutter :("
end
