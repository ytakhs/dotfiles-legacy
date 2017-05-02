function peco_source_search
  ag $argv . | peco --exec 'awk -F : '"'"'{print "+" $2 " " $1}'"'"' | xargs less '
  commandline -f repaint
end
