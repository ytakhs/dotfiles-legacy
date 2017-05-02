function peco_select_ghq_repo
  ghq list | peco | read repo
  if [ $repo ]
    ghq root | read ghq_dir
    cd $ghq_dir/$repo
  end
  commandline -f repaint
end
