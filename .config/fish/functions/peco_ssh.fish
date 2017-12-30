function peco_ssh
  set -l ssh_config_path $HOME/.ssh/config
  if [ ! -f $ssh_config_path ]
    echo "there is no $ssh_config_path"
  else
    awk 'tolower($1)=="host" { for(i=2;i<=NF;i++) { if ($i !~ "[*?]") { print $i } } }' $ssh_config_path | sort | peco | read -l ssh_hostname
    if [ ! -n "$ssh_hostname" ]
      echo "no such hostname: $ssh_hostname"
    else
      ssh $ssh_hostname
    end
  end
  commandline -f repaint
end
