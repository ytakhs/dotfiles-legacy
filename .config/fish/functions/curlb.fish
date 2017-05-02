function curlb
  curl -s -o /dev/null -w 'total: %{time_total}\nstarttransfer: %{time_starttransfer}\n' $argv
end
