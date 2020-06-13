set -x GOPATH $HOME/dev
set -x PATH $GOPATH/bin $PATH
set -x EDITOR vim

# vcxsrv for WSL2
if [ -e /etc/resolve.conf ];
  set -x DISPLAY (cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
end

# rust
if [ -f $HOME/.cargo/env ]
  set -x PATH $HOME/.cargo/bin $PATH
else
  echo "no cargo :("
end

if [ -d $HOME/.rbenv ]
  set -x fish_user_paths $HOME/.rbenv/bin $fish_user_paths
  status --is-interactive && source (rbenv init -|psub)
else
  echo "no rbenv :("
end
