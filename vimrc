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
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]
"unite general settings
"インサートモードで開始
let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50
"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''
"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
	"ESCでuniteを終了
	nmap <buffer> <ESC> <Plug>(unite_exit)
	"入力モードのときjjでノーマルモードに移動
	imap <buffer> jj <Plug>(unite_insert_leave)
	"入力モードのときctrl+wでバックスラッシュも削除
	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
	"ctrl+jで縦に分割して開く
	nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	"ctrl+jで横に分割して開く
	nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	"ctrl+oでその場所に開く
	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

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
Plugin 'othree/html5.vim'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'tpope/vim-commentary'

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
