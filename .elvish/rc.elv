use readline-binding

use epm
epm:install &silent-if-installed=$true \
            github.com/zzamboni/elvish-modules \
            github.com/zzamboni/elvish-completions \
            github.com/zzamboni/elvish-themes \
            github.com/muesli/elvish-libs

use github.com/zzamboni/elvish-themes/chain

chain:segment-style = [
  &git-branch= [lightgray]
]
