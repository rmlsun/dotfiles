set nocompatible               " be iMproved
filetype off                   " required!
set shell=/bin/bash
" change leader key
:let mapleader = ","

" + (system clipboard) register becomes default register
"set clipboard=unnamed
"
" curl -ksfLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Plugins with vim-plug: BEGIN
call plug#begin()

" intent line
"Plug 'Yggdroot/indentLine'
"let g:indentLine_setColors = 0

" sensible
" Plug 'tpope/vim-sensible'

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

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

function! s:list_cmd()
  let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)

" Open hotkeys
map <C-p> :Files<CR>
nmap <leader>; :Buffers<CR>

" supertab
Plug 'ervandew/supertab'

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/tpope-vim-abolish'

" status line
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileencoding', 'filetype' ] ],
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction


let g:colorscheme_init_deus = 'mkdir -p ~/.config/nvim/colors && cp ~/.local/share/nvim/plugged/vim-deus/colors/deus.vim ~/.config/nvim/colors'
Plug 'ajmwagar/vim-deus', { 'do': g:colorscheme_init_deus }
colorscheme deus

" Plugins with vim-plug: END
call plug#end()

syntax on
set pastetoggle=<F2>

" hightlight current line and current column
set cursorline
set cursorcolumn

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
set gdefault

hi NonText ctermbg=none
hi Normal guibg=NONE ctermbg=NONE
if !has('gui_running')
  set t_Co=256
endif

" Jump to start and end of line using the home row keys
nmap <leader>h ^
nmap <leader>l $

" Sane splits
set splitright
set splitbelow

" Permanent undo
set undodir=~/.nvimdid
set undofile

" support mouse
set mouse=a

" indent
set smartindent
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

set listchars=eol:⏎,tab:␉·,trail:␠,nbsp:⎵
nmap <leader>i :set invlist<cr>

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
nnoremap <leader>qo :copen<CR>
nnoremap <leader>qc :cclose<CR>

" status line
" set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
filetype plugin indent on     " required!

" ignore patterns
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

" Quick-save
nmap <leader>w :w<CR>

noremap <leader>s :Rg
if executable('rg')
    set grepprg=rg\ --no-heading\ --vimgrep
    set grepformat=%f:%l:%c:%m
endif
