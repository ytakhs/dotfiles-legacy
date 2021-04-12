set -x GOPATH $HOME/dev
set -x PATH $GOPATH/bin $PATH
set -x EDITOR vim

# vcxsrv for WSL2
if [ -e /etc/resolv.conf ]
  set -x DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
else if [ -e /run/resolvconf/resolv.conf ]
  set -x DISPLAY (cat /run/resolvconf/resolv.conf | grep nameserver | awk '{print $2}'):0
else
  echo "cannot resolve"
end

set -x LIBGL_ALWAYS_INDIRECT true

# rust
if [ -f $HOME/.cargo/env ]
  set -x PATH $HOME/.cargo/bin $PATH
else
  echo "no cargo :("
end

if [ -d $HOME/.rbenv ]
  set -x PATH $HOME/.rbenv/bin $PATH
  status --is-interactive && source (rbenv init -|psub)
else
  echo "no rbenv :("
end

if [ -d $HOME/.local ]
  set -x PATH $HOME/.local/bin $PATH
else
  echo "no $HOME/.local"
end

set -x PATH /usr/local/go/bin $PATH

# node
if [ -d $HOME/.nodenv ]
  set -x PATH $HOME/.nodenv/bin $PATH
  status --is-interactive; and source (nodenv init -|psub)
end

if [ -d $HOME/.poetry ]
  set -x PATH $HOME/.poetry/bin $PATH
end
