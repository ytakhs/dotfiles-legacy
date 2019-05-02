function peco_git_checkout
  __fish_disable_bracketed_paste

  git branch -a | peco | tr -d ' ' | read branch
  echo $branch
  if [ $branch ]
    if string match -r "remotes\/" $branch > /dev/null
      set -l b (string replace -r 'remotes\/(?:google|origin)\/(.*)' '$1' $branch)
      git checkout -b $b $branch
    else
      git checkout $branch
    end
  end

  commandline -f repaint
end
