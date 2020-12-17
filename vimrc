"===========================
"init .vimrc
"===========================
inoremap <C-k> <esc>
autocmd!
set verbose=0

syntax on
filetype plugin on

set number
set showcmd
set laststatus=2
set title
set noswapfile

set cindent
set hlsearch
set autoindent
set smartindent
set smarttab

set tabstop=4
set shiftwidth=4
set expandtab
set shiftround
set cursorline
set encoding=utf-8
set matchpairs+=<:>
set showmatch
set redrawtime=2000

let mapleader="\<Space>"
tnoremap <silent> <ESC> <C-\><C-n>
colorscheme molokai
set t_Co=256
"===========================
"perl
"===========================
nmap <F4> :w !perl<CR>
autocmd BufNewFile,BufRead t,psgi,pm  set filetype=perl
autocmd FileType perl,cgi,psgi,pm :compiler perl
command! Tf :edit `=tempname()`
command! Tfp :edit `=tempname()`|:set filetype=perl
"add comment for perl
nmap ,# :s/^/#/<CR>:nohlsearch<CR>
"snippet
inoreabbrev PDA use Data::Dumper; $Data::Dumper::Deparse = 1;
inoreabbrev PST #!/usr/bin/perl<CR>use strict;<CR>use warnings;<CR><CR>

"===========================
"ruby
"===========================
autocmd BufNewFile,BufRead *.rb   set tabstop=2 shiftwidth=2 softtabstop=2

"===========================
"python
"===========================
autocmd BufNewFile,BufRead *.py  set filetype=python

"===========================
"typescript
"===========================
let g:tsuquyomi_completion_detail = 1
autocmd FileType typescript setlocal completeopt+=menu,preview

"===========================
"Java
"===========================
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1

"===========================
"HTML
"===========================
"autocmd BufNewFile *.html 0r $HOME/.vim/template/html5.temp

"===========================
"Markdown
"===========================
au BufRead,BufNewFile *.md set filetype=markdown

"===========================
"vi util
"===========================
"//map//
"buffer next
nmap <C-n> :bn<CR>
"buffer pre
nmap <C-p> :bp<CR>
"nomar-mod insert CR
nmap <CR> i<CR><ESC>
"hightlight off
set hlsearch!
nnoremap <F3> :set hlsearch!<CR>
"//visual mode//
"visual out mode indent
vnoremap > >gv
vnoremap < <gv

nmap <silent><C-\> :nohlsearch <CR><ESC>

"//user function//
function! Crfc()
    :!osascript ~/.vim/bin/chrome_reflash.scpt
endfunction
noremap <F5> :<C-u>call Crfc()<CR>

command EE NERDTree
" ショートカット
nnoremap <silent><C-e> :NERDTreeToggle<CR> 

" Unite
command Ubuf Unite buffer
let g:unite_enable_start_insert=1
"let g:unite_source_history_yank_enable=1
let g:unite_source_file_mru_limit=200
"nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

"Quickrun alias
nmap <Leader>r <plug>(quickrun)
"let b:quickrun_config = {'outputter/buffer/split': 'botright'} "画面下段に出力を表示
let b:quickrun_config = {'outputter/buffer/into': 1}    "実行後にカーソルをバッファへ移動。これをやればqだけで出力バッファを閉じれる

"tab keymap
nnoremap <silent> <leader>tn :<c-u>tabnext<cr>

"===========================
" Vundle.vim 
"===========================
set nocompatible              " be iMproved, required
filetype off                  " required

"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'othree/yajs.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'thinca/vim-quickrun'
Plugin 'petdance/vim-perl'
Plugin 'hotchpotch/perldoc-vim'
Plugin 'mattn/emmet-vim'
Plugin 'nathanaelkane/vim-indent-guides' 
Plugin 'JavaScript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/neomru.vim'
Plugin 'kannokanno/previm'
Plugin 'tyru/open-browser.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'Quramy/tsuquyomi'
Plugin 'tomasr/molokai'
Plugin 'ujihisa/unite-colorscheme'
Plugin 'cohama/lexima.vim'

" " plugin from http://vim-scripts.org/vim/scripts.html
" " Plugin 'L9'
" " Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Install L9 and avoid a Naming conflict if you've already installed a
" " different version somewhere else.
" " Plugin 'ascenator/L9', {'name': 'newL9'}

" " All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
":PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
"auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
