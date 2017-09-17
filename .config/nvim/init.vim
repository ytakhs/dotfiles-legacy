let s:dein_dir = expand("~/.config/nvim/cache/dein")
let s:dein_repo_dir = s:dein_dir . "/repos/github.com/Shougo/dein.vim"

if &runtimepath !~# "/dein.vim"
  if !isdirectory(s:dein_repo_dir)
    execute "!git clone https://github.com/Shougo/dein.vim" s:dein_repo_dir
  endif
  execute "set runtimepath^=" . fnamemodify(s:dein_repo_dir, ":p")
endif
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml("~/.config/nvim/bundle/dein.toml")

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
let g:python3_host_prog = '/usr/local/bin/python3'
let g:deoplete#enable_at_startup = 1

runtime! init/keybindings.vim
runtime! init/editor.vim

