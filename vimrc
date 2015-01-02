"===========================
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
colorscheme koehler
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
"python
"===========================
autocmd BufNewFile,BufRead *.py  set filetype=python
autocmd BufNewFile,BufRead *.py  0r $HOME/.vim/template/python.temp
inoreabbrev PYST #!/usr/bin/python<CR>#-*-coding: utf8-*-<CR>

"===========================
"HTML
"===========================

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
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
"Buf enter -> currentbuf
autocmd BufEnter * execute ":lcd".expand("%:p:h")
"serch hilight erase
nmap <silent><C-\> :nohlsearch <CR><ESC>

"//user function//
function! Crfc()
    :!osascript ~/.vim/bin/chrome_reflash.scpt
endfunction
noremap <F5> :<C-u>call Crfc()<CR>
