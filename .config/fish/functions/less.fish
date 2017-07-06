function less
  if [ ! $argv ]
    echo "no file"
  else
    if which pygmentize > /dev/null 2>&1
      pygmentize -f terminal16m -O style=friendly $argv | command less -R
    else
      command less $argv
    end
  end
end
