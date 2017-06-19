function chrome
  switch (uname -s)
    case Darwin
      eval '/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome' $argv
    case '*'
      echo ""
    end
end
