"===========================
"init .vimrc
"===========================
autocmd!
"verbose
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
"helptags ~/.vim/doc
set encoding=utf-8

"===========================
"perl
"===========================
map <F4> :w !perl<CR>
autocmd BufNewFile,BufRead t,psgi  set filetype=perl
autocmd FileType perl,cgi,psgi :compiler perl

"===========================
"python
"===========================
autocmd BufNewFile,BufRead *.py  set filetype=python
autocmd BufNewFile,BufRead *.py  0r $HOME/.vim/template/python.temp




"===========================
"vi util
"===========================
"//map//
"buffer next
nmap <C-n> :bn<CR>
"buffer pre
nmap <C-p> :bp<CR>
"add comment for perl
nmap ,# :s/^/#/<CR>
"nomar-mod insert CR
nmap <CR> i<CR><ESC>
"visual out mode indent
vnoremap > >gv
vnoremap < <gv
"closed {}
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>



"//autocmd//
"Buf enter -> currentbuf
autocmd BufEnter * execute ":lcd".expand("%:p:h")
"serch hilight erase
nmap <silent><C-\> :nohlsearch <CR><ESC>
command! Tf :edit `=tempname()`
command! Tfp :edit `=tempname()`|:set filetype=perl
autocmd BufNewFile,BufRead tt  set filetype=html
inoremap <C-c> <Esc>

"//user function
function! Crfc()
    :!osascript ~/.vim/bin/chrome_reflash.scpt
endfunction
noremap <F5> :<C-u>call Crfc()<CR>
