set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x PATH $HOME/.exenv/shims $PATH
set -x PATH $HOME/.rbenv/shims $PATH
rbenv init - | source
