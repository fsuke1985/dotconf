"==========================
"init .vimrc
"===========================
inoremap <C-e> <Esc>
autocmd!
set verbose=0

syntax on
filetype plugin on

set number
set showmatch
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
set expandtab
set shiftwidth=4
set shiftround
set cursorline
"colorscheme koehler
set encoding=utf-8

"===========================
"perl
"===========================
nmap <F4> :w !perl<CR>
autocmd BufNewFile,BufRead t,psgi  set filetype=perl
autocmd FileType perl,cgi,psgi :compiler perl
autocmd BufNewFile,BufRead *.psgi   set filetype=perl
autocmd BufNewFile,BufRead *.t      set filetype=perl
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
autocmd BufNewFile,BufRead *.py  0r $HOME/.vim/template/python.temp
inoreabbrev PYST #!/usr/bin/python<CR>#-*-coding: utf8-*-<CR>


"===========================
"avascript
"===========================
"au FileType javascript call JavaScriptFold()

"===========================
"HTML
"===========================
autocmd BufNewFile *.html 0r $HOME/.vim/template/html5.temp

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

"//visual mode//
"visual out mode indent
vnoremap > >gv
vnoremap < <gv

"//etc//
"auto closed {}
"inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap [<Enter> []<Left><CR><ESC><S-o>
"inoremap (<Enter> ()<Left><CR><ESC><S-o>
"Buf enter -> currentbuf
autocmd BufEnter * execute ":lcd".expand("%:p:h")
"serch hilight erase
nmap <silent><C-\> :nohlsearch <CR><ESC>

"//user function//
function! Crfc()
    :!osascript ~/.vim/bin/chrome_reflash.scpt
endfunction
noremap <F5> :<C-u>call Crfc()<CR>

"===========================
"" Start Neobundle Settings.
"===========================
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
"Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'
" 追加するプラグイン
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'nathanaelkane/vim-indent-guides' 
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'hail2u/vim-css3-syntax'
call neobundle#end()
" Required:
filetype plugin indent on
"
"未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
