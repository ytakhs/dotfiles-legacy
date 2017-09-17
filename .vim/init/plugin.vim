let s:dein_dir = expand("~/.cache/vim/dein")
let s:dein_repo_dir = s:dein_dir . "/repos/github.com/Shougo/dein.vim"

if &runtimepath !~# "/dein.vim"
  if !isdirectory(s:dein_repo_dir)
    execute "!git clone https://github.com/Shougo/dein.vim" s:dein_repo_dir
  endif
  execute "set runtimepath^=" . fnamemodify(s:dein_repo_dir, ":p")
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  
  call dein#add("joshdick/onedark.vim")
  call dein#add("vim-airline/vim-airline")
  call dein#add("Shougo/unite.vim")
  call dein#add("Shougo/neocomplete.vim", {"lazy": 1})
  call dein#add("Shougo/vimproc.vim", {"build": "make"})
  call dein#add("airblade/vim-gitgutter")

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

