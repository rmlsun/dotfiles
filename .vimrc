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

" search
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase

" support mouse
set mouse=a

" indent 
set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

"set noswapfile
" put swap files in one place
set dir=/tmp

" last tab
let g:lasttab = 1
nmap <Leader>lt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" change window local directory
nnoremap <Leader>cd :lcd %:p:h<CR>:pwd<CR>
" Find current file in NERDTree
nnoremap <leader>nf :NERDTreeFind<cr>

" ctags
set tags=./tags;/

" Quickfix window item navigation
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>

" status line
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" 
" get vundle: git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'L9'
" plugins on github
" NERDTree
Bundle 'scrooloose/nerdtree.git'
map <F3> :NERDTreeToggle<CR>

" Lusty explorer
Bundle 'vim-scripts/LustyExplorer'
Bundle 'vim-scripts/LustyJuggler'
:set hidden
let g:LustyExplorerDefaultMappings = 1

" CtrlP
Bundle 'kien/ctrlp.vim'
Bundle 'JazzCore/ctrlp-cmatcher'
" Bundle 'FelikZ/ctrlp-py-matcher'
let g:ctrlp_map = '<C-P>'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}
"let g:ctrlp_match_func = {'match': 'pymatcher#PyMatch'}
let g:ctrlp_max_files = 0

" TagBar
Bundle 'majutsushi/tagbar'
nnoremap <leader>tt :TagbarToggle<CR>
nnoremap <leader>tf :TagbarOpenAutoClose<CR>

" airline
Bundle 'bling/vim-airline'

" cscope
" mirror of http://cscope.sourceforge.net/cscope_maps.vim
Bundle 'chazy/cscope_maps'
Bundle 'vim-scripts/autoload_cscope.vim'

" Bookmark
Bundle 'MattesGroeger/vim-bookmarks'
nmap bm <Plug>BookmarkToggle
nmap bi <Plug>BookmarkAnnotate
nmap ba <Plug>BookmarkShowAll
nmap bj <Plug>BookmarkNext
nmap bk <Plug>BookmarkPrev
nmap bc <Plug>BookmarkClear
nmap bx <Plug>BookmarkClearAll

" syntastic
Bundle 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
nnoremap <leader>st :SyntasticToggleMode<CR>
nnoremap <leader>sc :SyntasticCheck<CR>

" supertab
Bundle 'ervandew/supertab'

Bundle 'tpope/vim-sensible'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'hallison/vim-markdown'
" have vim recognize .md file
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
"Bundle 'klen/python-mode'

" solarized
Bundle 'altercation/vim-colors-solarized'
" set background=light
 set background=dark
colorscheme solarized
" let base16colorspace=256
" colorscheme base16-solarized
" colorscheme base16-default
let g:solarized_termtrans = 1

" for git
Bundle 'tpope/vim-fugitive'
autocmd User fugitive 
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
" autocmd BufReadPost fugitive://* set bufhidden=delete

" vdebug
"Bundle 'joonty/vdebug'
"let g:vdebug_options["port"] = 9002

call vundle#end()
filetype plugin indent on     " required!
