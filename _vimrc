set nocompatible

execute pathogen#infect('C:\Users\delossantosj\Documents\git\vim\{}')

" Windows
set guifont=Consolas:h10:cANSI
au GUIEnter * simalt ~x

if &t_Co >= 256 || has("gui_running")
   colorscheme solarized
   set background=dark
endif

if &t_Co > 2 || has("gui_running")
   " switch syntax highlighting on, when the terminal has colors
   syntax on
endif

" relative number
set relativenumber rnu

" gui memes
:set guioptions-=m  "remove menu bar
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" file backup settings
:set nobackup
:set noswapfile

filetype plugin indent on
