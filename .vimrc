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

" sensible
Plug 'tpope/vim-sensible'

" nerdtree
Plug 'scrooloose/nerdtree' ", { 'on':  'NERDTreeToggle' }
map <F3> :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<cr>
" Ignore pyc files
let NERDTreeIgnore = ['\.pyc$']

" TabMan
Plug 'kien/tabman.vim'
let g:tabman_toggle = '<leader>mt'
let g:tabman_focus  = '<leader>mf'
let g:tabman_side = 'right'
let g:tabman_specials = 0
let g:tabman_number = 0


" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<C-P>'
let g:ctrlp_max_files = 0
let g:ctrlp_working_path_mode = 'ra'
" Plug 'JazzCore/ctrlp-cmatcher'
" let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
"       \ --ignore .git
"       \ --ignore .svn
"       \ --ignore .hg
"       \ --ignore .DS_Store
"       \ --ignore "**/*.pyc"
"       \ -g ""'
" let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}
Plug 'FelikZ/ctrlp-py-matcher'
let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}

" airline
Plug 'bling/vim-airline'

" supertab
Plug 'ervandew/supertab'

" solarized
let g:solarized_install = 'mkdir -p ~/.vim/colors && cp ./colors/solarized.vim ~/.vim/colors'
Plug 'altercation/vim-colors-solarized', { 'do': g:solarized_install }
colorscheme solarized
set background=dark

" source ~/.vimrc_mod_dev
" source ~/.vimrc_mod_golang

" Plugins with vim-plug: END
call plug#end()
