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
" set cursorcolumn

set nobackup
set nowritebackup
set noswapfile

" search
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
set autowrite

" support mouse
set mouse=a

" indent
" set smartindent
" set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" line number
set nu

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
nnoremap <leader>qc :cclose<CR>

" status line
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
filetype plugin indent on     " required!

" ignore patterns
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

"
" curl -ksfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Plugins with vim-plug: BEGIN
call plug#begin()

" intent line
Plug 'Yggdroot/indentLine'
let g:indentLine_setColors = 0

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
let g:ctrlp_cmatcher_install = './install.sh'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Plug 'JazzCore/ctrlp-cmatcher', { 'do': g:ctrlp_cmatcher_install }
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

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'

" colorscheme pack
"let g:colorscheme_init = 'mkdir -p ~/.vim/colors && cp ~/.vim/plugged/vim-colorschemes/colors/PaperColor.vim ~/.vim/colors'
"Plug 'flazz/vim-colorschemes', { 'do': g:colorscheme_init }
Plug 'flazz/vim-colorschemes'
"colorscheme Monokai

let g:colorscheme_init_dracula = 'mkdir -p ~/.vim/colors && cp ~/.vim/plugged/vim/colors/dracula.vim ~/.vim/colors'
Plug 'dracula/vim', { 'do': g:colorscheme_init_dracula }
color dracula

let g:colorscheme_init_deus = 'mkdir -p ~/.vim/colors && cp ~/.vim/plugged/vim-deus/colors/deus.vim ~/.vim/colors'
Plug 'ajmwagar/vim-deus', { 'do': g:colorscheme_init_deus }
"color deus


"set background=dark


source ~/.vimrc_mod_dev
source ~/.vimrc_mod_golang

" Plugins with vim-plug: END
call plug#end()
