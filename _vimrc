set nocompatible

execute pathogen#infect('documents/git/vim/{}')

source $VIMRUNTIME/mswin.vim
behave mswin

" Windows
set guifont=Consolas:h10:cANSI
au GUIEnter * simalt ~x

au BufRead,BufNewFile *.cshtml setfiletype html

if &t_Co >= 256 || has("gui_running")
   colorscheme solarized
   set background=dark
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

let mapleader=","

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
nmap <silent> <leader>wu :update<CR>:e ++ff=unix<CR>:setlocal ff=dos<CR>:w<CR>
nmap <silent> <leader>wd :update<CR>:e ++ff=dos<CR>:setlocal ff=unix<CR>:w<CR>

nnoremap ; :
nnoremap <C-F1> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
nnoremap <C-F2> :if &go=~#'T'<Bar>set go-=T<Bar>else<Bar>set go+=T<Bar>endif<CR>
nnoremap <C-F3> :if &go=~#'r'<Bar>set go-=r<Bar>else<Bar>set go+=r<Bar>endif<CR>
nnoremap <C-l> :nohl<CR><C-l>
nnoremap <A-[> :bprevious<CR>
nnoremap <A-]> :bnext<CR>
nnoremap <silent> <F4> :let @*=expand("%:p")<CR>

nnoremap j gj
nnoremap k gk

" settings
setlocal ff=dos
set hidden

set diffopt+=iwhite
set diffexpr=""

set nowrap
set nowrap
set ruler
set tabstop=4
set backspace=indent,eol,start

set smartindent
set autoindent
set copyindent
set number
set shiftwidth=4
set expandtab
set shiftround
set showmatch
set ignorecase
set smartcase
set relativenumber rnu

set smarttab

set hlsearch
set incsearch

set history=1000
set undolevels=1000
set title
set noerrorbells

set guioptions-=T
set guioptions-=m
set guioptions-=l
set guioptions-=r
set guioptions-=b
set nobackup
set noswapfile

set pastetoggle=<F2>
set mouse=a
set autoread
set laststatus=2

filetype plugin indent on

