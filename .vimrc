" 行番号

set fenc=utf-8
set nobackup
set noswapfile
set showcmd
set number
set clipboard+=unnamed,autoselect
set autoindent
set tabstop=2
set expandtab
set shiftwidth=2
set cursorline
set hlsearch
set incsearch
set mouse=a
set wildmenu wildmode=list:longest,full
set visualbell t_vb=
set noerrorbells
syntax on

if has('multi_byte_ime') || has('xim') || has('gui_macvim')
  " Insert mode: lmap off, IME ON
  set iminsert=2
  " Serch mode: lmap off, IME ON
  set imsearch=2
  " Normal mode: IME off
  inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif
