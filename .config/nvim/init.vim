let g:ale_completion_enabled=1
"enable plugin manager
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'lifepillar/vim-solarized8'
Plug 'autozimu/LanguageClient-neovim', {
            \ 'branch': 'next',
            \ 'do': 'bash install.sh',
            \ }

"file browser
Plug 'scrooloose/nerdtree'
"async linter
Plug 'w0rp/ale'

"Fuzzy finder/nselection
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf'

"formatter for c familiy
Plug 'rhysd/vim-clang-format'

" this is for i3config syntax highlighting
Plug 'mboughaba/i3config.vim'

"provides small icons for lines, changed/added in git
Plug 'airblade/vim-gitgutter'

"Completion for C/Cpp
Plug 'Valloric/YouCompleteMe'
call plug#end()

if executable('fzf')
    "enable ctrlp for fzf
    nnoremap <silent> <C-p> :call FZFExecute()<CR>
end
function! FZFExecute()


  " Remove trailing new line to make it work with tmux splits
  let directory = substitute(system('git rev-parse --show-toplevel'), '\n$', '', '')
  if !v:shell_error
    call fzf#run({'sink': 'e', 'dir': directory, 'source': 'git ls-files'})
  else
    FZF
  endif
endfunction

let g:height = float2nr(&lines * 0.9)
let g:width = float2nr(&columns * 0.95)
let g:preview_width = float2nr(&columns * 0.7)
let g:fzf_buffers_jump = 1
let $FZF_DEFAULT_OPTS=" --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4 --preview 'if file -i {}|grep -q binary; then file -b {}; else bat --style=changes --color always --line-range :40 {}; fi' --preview-window right:" . g:preview_width
"let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:0,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF(' . g:width . ',' . g:height . ')' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')
  '
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction
  

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
"map Q to not switch to ex-mode
nmap Q q

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
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
            \ 'typescript': ['/usr/bin/javascript-typescript-stdio'],
            \ }

autocmd Filetype typescript source ~/.vim/ftplugin/typescript.vim

"toggle nerd tree
map <C-n> :NERDTreeToggle<CR>

"youcompleteme, accept current suggestion w/ CR
let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Allows to open the current buffer in a new tab (allowing to view in full screen)
noremap tt :tab split <CR>

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
"map tab to toggle fold 
noremap <tab> za 

"using systems clipboard on yank/delete
set clipboard=unnamedplus

"enable recursive search with built-in 'find's
set path+=**

"load .vimrc in current folder securely
set exrc
set secure

aug i3config_ft_detection
    au!
    au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end


" set filetype for asm files
aug asm_ft_detection
    au!
    au BufNewFile,BufRead *.asm set filetype=nasm
    au BufNewFile,BufRead *.asm let  g:ale_nasm_nasm_options = "-f elf64"
aug end


" enable autoformat on save
autocmd FileType c ClangFormatAutoEnable

