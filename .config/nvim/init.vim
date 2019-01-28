"enable plugin manager
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'

call plug#end()


"enable the current line number plus relative numbers above and below
set number
set number relativenumber

"enable syntax highlighting
syntax on

"enable indentation based on plugins in ~/.vim/indent/*
filetype plugin indent on

"set color scheme
colo desert

"Remap capital Q to also close the terminal
:command! -bar -bang Q quit<bang>

"Map Y to yank to the end of the line.
noremap Y y$

"start searching right away
set incsearch

