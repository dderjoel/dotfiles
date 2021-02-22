let g:ale_completion_enabled=1
"enable plugin manager
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
"Themes
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'

" Plug 'autozimu/LanguageClient-neovim', {
"             \ 'branch': 'next',
"             \ 'do': 'bash install.sh',
"             \ }

"complete for TS/C/...
Plug 'neoclide/coc.nvim', {'branch':'release'}

" This is the backend for coc-vimtex
Plug 'lervag/vimtex'

"file browser
" Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'ryanoasis/vim-devicons'

" Shortcut for commenting a line
Plug 'preservim/nerdcommenter'
"async linter
"Plug 'w0rp/ale'

Plug 'ctrlpvim/ctrlp.vim' "fuzzy find files

"formatter for c familiy
Plug 'rhysd/vim-clang-format'

" this is for syntax highlighting
Plug 'mboughaba/i3config.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'HerringtonDarkholme/yats.vim'
"provides small icons for lines, changed/added in git
Plug 'airblade/vim-gitgutter'

"Completion for C/Cpp
"Plug 'Valloric/YouCompleteMe'
call plug#end()

" ctrlp
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_user_command = ['.git/', 'git ls-files -oc --exclude-standard']

"enable the current line number plus relative numbers above and below
set number
set number relativenumber

"enable syntax highlighting
syntax on

"enable indentation based on plugins in ~/.vim/indent/*
filetype plugin indent on

"set color scheme
set termguicolors
colo gruvbox
set background=dark

"Remap capital Q to also close the terminal
:command! -bar -bang Q quit<bang>
"map Q to not switch to ex-mode
nmap Q qa

"Multimode-mappings to switch between buffers
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
" let g:LanguageClient_autoStart = 1
"let g:LanguageClient_serverCommands = {
" \ 'typescript': ['/usr/bin/javascript-typescript-stdio'],
" \ }

"autocmd Filetype typescript source ~/.vim/ftplugin/typescript.vim

:nmap <space>e :CocCommand explorer<CR>
" nerd tree Settings
" map <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeIgnore = ['^node_modules$']
"
" " sync open file with NERDTree
" " Check if NERDTree is open or active
" function! IsNERDTreeOpen()
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction
"
" " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" " file, and we're not in vimdiff
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeFind
"     wincmd p
"   endif
" endfunction

" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

"Commenter Settings
vmap <leader><space> <plug>NERDCommenterToggle
nmap <leader><space> <plug>NERDCommenterToggle
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1
"intendation
"show existing tab with 4 spaces
set tabstop=4
"intend with 4 spaces
set shiftwidth=4
"intent with spaces instead of tabs
set expandtab

"colorcolumn at 180
set colorcolumn=180

"Folding
set foldlevel=1
"Force myself into using folds:
set foldmethod=syntax

"using systems clipboard on yank/delete
set clipboard=unnamedplus

"enable recursive search with built-in 'find's
set path+=**

"load .vimrc in current folder securely
set exrc
set secure

aug i3config_ft_detection
    au!
    au BufNewFile,BufRead ~/dotfiles/.config/i3/config set filetype=i3config
aug end

"let g:ale_fixers = {
            "\ "*":['remove_trailing_lines', 'trim_whitespace'],
            "\ 'javascript': ['eslint'],
            "\ 'typescript': ['eslint']
"\}
"let g:ale_fix_on_save = 1
"let g:ale_sign_error=">"
"let g:ale_sign_warning="-"
"let g:ale_lint_delay=1000

"COC Settings

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Highlight symbol under cursor on CursorHold after .8sec
set updatetime=800
autocmd CursorHold * silent call CocActionAsync('highlight')
"Symbol rename
nmap <F2> <Plug>(coc-rename)

nmap <silent> KK <Plug>(coc-definition)

"END COC Settings

aug ts_ft_detection
    au!
    au BufNewFile,BufRead *.ts let b:ale_fixers=['eslint']
aug end
"set flavor for vimtex, see :help vimtex-tex-flavor
let g:tex_flavor = "latex"

" set filetype for asm files
aug asm_ft_detection
    au!
    au BufNewFile,BufRead *.asm set filetype=nasm
    au BufNewFile,BufRead *.asm let  g:ale_nasm_nasm_options = "-f elf64"
aug end


" enable autoformat on save
"autocmd FileType c ClangFormatAutoEnable -> commented, since this should be
"done by coc
aug json_ft_detection
    au!
    au FileType json syntax match Comment +\/\/.\+$+
aug end

" vim -b : edit binary using xxd-format!
augroup Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
augroup END!

aug tex_ft_detection
    au!
    au FileType tex g:vimtex_compiler_progname = "nvr"
aug end
