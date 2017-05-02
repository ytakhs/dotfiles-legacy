function peco_git_checkout
  git branch -a | peco | tr -d ' ' | read branch
  echo $branch
  if [ $branch ]
    if string match -r "remotes\/" $branch > /dev/null
      set -l b (string replace -r 'remotes/origin/(.*)' '$1' $branch)
      git checkout -b $b $branch
    else
      git checkout $branch
    end
  end
  commandline -f repaint
end
