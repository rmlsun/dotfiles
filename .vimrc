set nocompatible               " be iMproved
filetype off                   " required!
syntax on

" change leader key
:let mapleader = ","

" + (system clipboard) register becomes default register
"set clipboard=unnamed

" pastetoggle
set pastetoggle=<F2>

" hightlight current line and current column
set cursorline
set cursorcolumn

set nobackup
set nowritebackup
"set noswapfile

" search
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" support mouse
set mouse=a

" indent
" set smartindent
" set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" put swap files in one place
set dir=/tmp

" last tab
let g:lasttab = 1
nmap <Leader>lt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" change window local directory
nnoremap <Leader>cd :lcd %:p:h<CR>:pwd<CR>

" ctags
set tags=./tags;/

" Quickfix window item navigation
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" status line
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
filetype plugin indent on     " required!

"
" curl -ksfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 
" Plugins with vim-plug: BEGIN
call plug#begin()

source ~/.vimrc_mod_core
"source ~/.vimrc_mod_dev
"source ~/.vimrc_mod_golang

" Plugins with vim-plug: END
call plug#end()
