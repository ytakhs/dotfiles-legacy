function peco_select_ghq_repo
  ghq list --full-path | peco | read repo
  if [ $repo ]
    cd $repo
  end
  commandline -f repaint
end
