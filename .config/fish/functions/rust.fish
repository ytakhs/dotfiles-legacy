function rust --description "rust <toolchain> <file>"
  set -g toolchain +stable

  if string match -r '\+.+' $argv[1] > /dev/null
    set -g toolchain $argv[1]

    set --erase argv[1]
  end

  command cargo $toolchain script $argv
end
