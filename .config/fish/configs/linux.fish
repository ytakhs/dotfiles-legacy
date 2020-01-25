set -x GOPATH $HOME/dev
set -x PATH $GOPATH/bin $PATH
set -x EDITOR vim

if [ -d /home/linuxbrew/.linuxbrew ]
  set -x HOMEBREW_PREFIX /home/linuxbrew/.linuxbrew
  set -x HOMEBREW_CELLAR /home/linuxbrew/.linuxbrew/Cellar
  set -x HOMEBREW_REPOSITORY /home/linuxbrew/.linuxbrew/Homebrew
  set -x PATH /home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin $PATH
  set -x MANPATH /home/linuxbrew/.linuxbrew/share/man $MANPATH
  set -x INFOPATH /home/linuxbrew/.linuxbrew/share/info $INFOPATH
end

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
