set encoding=utf-8
set fileencodings=utf-8
set fileformats=unix,dos,mac
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
set backspace=indent,eol,start
syntax on

" insert mode
inoremap <silent> <C-a> <HOME>
inoremap <silent> <C-e> <END>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-b> <Left>
inoremap <silent> <C-p> <UP>
inoremap <silent> <C-n> <DOWN>

" commandline mode
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>
cnoremap <C-p> <UP>
cnoremap <C-n> <DOWN>

