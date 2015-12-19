syntax on
set number
set clipboard+=unnamed
set autoindent
set tabstop=2
set expandtab
set shiftwidth=4
set cursorline


if has('vim_starting')
<<<<<<< HEAD
		set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
"-----------------------------------------------------------------------
"プラグイン
"-----------------------------------------------------------------------
"---------------------------
"ファイル操作
"---------------------------
=======
	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
>>>>>>> origin/master
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'scrooloose/nerdtree'
<<<<<<< HEAD

"----------------------------
"カラースキーム
"----------------------------
NeoBundle 'tomasr/molokai'

"----------------------------
"文章補助
"----------------------------
NeoBundle 'tpope/vim-endwise'
NeoBundle 'itchyny/lightline.vim'
=======
NeoBundle 'tpope/vim-endwise'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tomasr/molokai'
>>>>>>> origin/master
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'
<<<<<<< HEAD
NeoBundle 'Shougo/neocomplete.vim'
"---------------------------
"HTML
"---------------------------
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jelera/vim-javascript-syntax'

"---------------------------
"Git操作
"---------------------------
NeoBundle 'tpope/vim-fugitive'

"---------------------------
"ruby
"---------------------------
NeoBundleLazy 'marcus/rsense',{
            \ 'autoload':{
            \ 'filetypes':'ruby',
            \ },
            \ }
NeoBundleLazy 'supermomonga/neocomplete-rsense.vim',{
            \'autoload' : {
            \'insert' : 1,
            \'filetypes' : 'ruby',
            \}}
"--------------------------
"rails
"--------------------------
NeoBundle 'tpope/vim-rails'
NeoBundle 'basyura/unite-rails'

call neobundle#end()
"-----------------------------------------------------------------------
"プラグイン設定
"-----------------------------------------------------------------------
"--------------------------
"vim-rails
"--------------------------
let g:rails_default_file='config/database.yml'
let g:rails_level = 4
let g:rails_mappings=1
let g:rails_modelines=0
let g:rails_some_option = 1
let g:rails_statusline = 1
let g:rails_subversion=0
let g:rails_syntax = 1
let g:rails_url='http://localhost:3000'
let g:rails_ctags_arguments='--languages=-javascript'
let g:rails_ctags_arguments = ''
function! SetUpRailsSetting()
  nnoremap <buffer><Space>r :R<CR>
  nnoremap <buffer><Space>a :A<CR>
  nnoremap <buffer><Space>m :Rmodel<Space>
  nnoremap <buffer><Space>c :Rcontroller<Space>
  nnoremap <buffer><Space>v :Rview<Space>
  nnoremap <buffer><Space>p :Rpreview<CR>
endfunction

aug MyAutoCmd
  au User Rails call SetUpRailsSetting()
aug END

aug RailsDictSetting
  au!
aug END
"---------------------------
"Unite
"---------------------------
=======
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'

call neobundle#end()
"Unite
>>>>>>> origin/master
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

<<<<<<< HEAD
"--------------------------
"NERDTree
"--------------------------
nnoremap <silent><C-e> :NERDTreeToggle<CR>


filetype plugin indent on
=======

filetype plugin indent on

>>>>>>> origin/master
