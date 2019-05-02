function peco_select_ghq_repo
  __fish_disable_bracketed_paste

  commandline | read query
  ghq list --full-path | peco --query $query | read repo

  if [ $repo ]
    cd $repo
  end

  commandline -f repaint
end
