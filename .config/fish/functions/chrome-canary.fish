function chrome-canary
  switch (uname -s)
    case Darwin
      eval '/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary' $argv
    case '*'
      echo "not supported :("
  end
end
