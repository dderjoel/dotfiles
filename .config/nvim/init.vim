let g:ale_completion_enabled=1
"enable plugin manager
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'lifepillar/vim-solarized8'
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

"fuzzy finder for files
Plug 'ctrlpvim/ctrlp.vim'

"file browser
Plug 'scrooloose/nerdtree'
"async linter
Plug 'w0rp/ale'

"Fuzzy finder/selection
"Plug 'junegunn/fzf'

"Plug 'HerringtonDarkholme/yats.vim'
"Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

"Provides SyntaxHighlight
Plug 'leafgarland/typescript-vim'
Plug 'posva/vim-vue'
"Plug 'Chiel92/vim-autoformat'

" For async completion
Plug 'Shougo/deoplete.nvim'
"Plug 'Shougo/denite.nvim'

"Tslint for vim
"Plug 'heavenshell/vim-tslint'

"Plug 'Quramy/tsuquyomi'
call plug#end()


"enable the current line number plus relative numbers above and below
set number
set number relativenumber

"enable syntax highlighting
syntax on

"enable indentation based on plugins in ~/.vim/indent/*
filetype plugin indent on

"set color scheme
set termguicolors
colo solarized8
set background=dark

"Remap capital Q to also close the terminal
:command! -bar -bang Q quit<bang>

"Map Y to yank to the end of the line.
noremap Y y$

"start searching right away
set incsearch

"enable scrolling/selecting resizing by mouse
set mouse=a

"enable instant preview of search/replace
set inccommand=split
nnoremap <Leader>k :%s/\<<C-r><C-w>\>//g<Left><Left>
vnoremap <Leader>k y :%s/<C-r>"//g<Left><Left>


"Language server specifications:
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
            \ 'typescript': ['/usr/bin/javascript-typescript-stdio'],
            \ }
autocmd Filetype typescript setlocal completefunc=LanguageClient#complete

"tsuquyomi
"let g:tsuquyomi_comletion_detail =1
"autocmd Filetype typescript setlocal completeopt+=menu,preview
"set ballooneval
"autocmd Filetype typescript setlocal balloonexpr=tsuquyomi#balloonexpr()
autocmd Filetype typescript source ~/.vim/ftplugin/typescript.vim

"toggle nerd tree
map <C-n> :NERDTreeToggle<CR>

"autocomplete startup
"let g:deoplete#enable_at_startup = 1

" power tab
"imap <silent><expr><tab> TabWrap()

" Enter: complete&close popup if visible (so next Enter works); else: break undo
inoremap <silent><expr> <Cr> pumvisible() ?
            \ deoplete#mappings#close_popup() : "<C-g>u<Cr>"

" Ctrl-Space: summon FULL (synced) autocompletion
inoremap <silent><expr> <C-Space> deoplete#mappings#manual_complete()

" Escape: exit autocompletion, go to Normal mode
inoremap <silent><expr> <Esc> pumvisible() ? "<C-e><Esc>" : "<Esc>"

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>


"intendation
"show existing tab with 4 spaces
set tabstop=4
"intend with 4 spaces
set shiftwidth=4
"intent with spaces instead of tabs
set expandtab

"colorcolumn at 180
set colorcolumn=180

