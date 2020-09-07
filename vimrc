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

"//etc//
"auto closed {}
"inoremap {<Enter> {}<Left><CR><ESC><S-o>
"inoremap [<Enter> []<Left><CR><ESC><S-o>
"inoremap (<Enter> ()<Left><CR><ESC><S-o>
"Buf enter -> currentbuf
"autocmd BufEnter * execute ":lcd".expand("%:p:h")
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
"NeoBundle 'Townk/vim-autoclose'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'petdance/vim-perl'
NeoBundle 'hotchpotch/perldoc-vim'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'nathanaelkane/vim-indent-guides' 
NeoBundle 'JavaScript-syntax'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Quramy/tsuquyomi'
<<<<<<< Updated upstream
=======
NeoBundle 'tomasr/molokai'
NeoBundle 'ujihisa/unite-colorscheme'
>>>>>>> Stashed changes

call neobundle#end()
filetype plugin indent on
"未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
" NERDTree入れたらデフォルトのEコマンドが使えなくなったのでalias設定
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
