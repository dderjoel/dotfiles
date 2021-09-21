"Get vim.plug
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"enable plugin manager
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'

" completion / linting / tooling for TS / C / well basically all langs...
Plug 'neoclide/coc.nvim', {'branch':'release'}

"sh formatter (pacman -S shfmt)
Plug 'z0mbix/vim-shfmt', { 'for': 'sh' }

"debuggger
Plug 'puremourning/vimspector'

" This is the backend for coc-vimtex
Plug 'lervag/vimtex'

" Shortcut for commenting a line
Plug 'preservim/nerdcommenter'

Plug 'ctrlpvim/ctrlp.vim' "fuzzy find files

"Themes
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
" this is for syntax highlighting
Plug 'aklt/plantuml-syntax'
Plug 'pearofducks/ansible-vim', { 'do': './UltiSnips/generate.sh' }
Plug 'mboughaba/i3config.vim'
Plug 'ekalinin/Dockerfile.vim'
Plug 'HerringtonDarkholme/yats.vim'

" provides small icons for lines, changed/added in git
Plug 'airblade/vim-gitgutter'

" enables git commit interface
Plug 'jreybert/vimagit'

call plug#end()


"enable the current line number plus relative numbers above and below + git info if available. needs nvim>0.5
set number
set number relativenumber
set signcolumn=number

"enable syntax highlighting
syntax on

"enable indentation based on plugins 
filetype plugin indent on

"set color scheme
set termguicolors
colo gruvbox
set background=dark

"Remap capital Q to also close the buffer
:command! -bar -bang Q quitall<bang>
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

:nmap <space>e :CocCommand explorer<CR>
:nmap <space>d :CocDiagnostics<CR>

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


" 
" START COC Settings
" 

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

"make
nmap <F5> :make<CR><CR>

" Highlight symbol under cursor on CursorHold after .8sec
set updatetime=800
autocmd CursorHold * silent call CocActionAsync('highlight')
"Symbol rename
nmap <F2> <Plug>(coc-rename)

nmap <silent> KK <Plug>(coc-definition)

"
" END COC Settings
"

" vimspector
"https://github.com/puremourning/vimspector#human-mode
fun! GotoWindow(id)
  :call win_gotoid(a:id)
endfun
func! AddToWatch()
  let word = expand("<cexpr>")
  call vimspector#AddWatch(word)
endfunction
let g:vimspector_enable_mappings = 'HUMAN'
let g:vimspector_sidebar_width = 60
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>

nnoremap <leader>da :call vimspector#Launch()<CR>
nnoremap <leader>di :call AddToWatch()<CR>
nnoremap <leader>dx :call vimspector#Reset()<CR>
nnoremap <leader>dX :call vimspector#ClearBreakpoints()<CR>
nnoremap <c-k> :call vimspector#StepOut()<CR>
nnoremap <c-l> :call vimspector#StepInto()<CR>
nnoremap <c-j> :call vimspector#StepOver()<CR>
nnoremap <c-n> :call vimspector#Continue()<CR>
nnoremap <leader>d_ :call vimspector#Restart()<CR>
nnoremap <leader>dn :call vimspector#Continue()<CR>
nnoremap <leader>drc :call vimspector#RunToCursor()<CR>
nnoremap <leader>dh :call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>de :call vimspector#ToggleConditionalBreakpoint()<CR>
let g:vimspector_sign_priority = {
  \    'vimspectorBP':         998,
  \    'vimspectorBPCond':     997,
  \    'vimspectorBPDisabled': 996,
  \    'vimspectorPC':         999,
  \ }
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval


" Default to svg make
aug pu_ft_detection
    au!
    " au BufRead *.pu let g:plantuml_executable_script = "plantuml -tsvg"
    au BufRead *.pu let &l:makeprg=g:plantuml_executable_script . " -tsvg %"
aug end


aug gyp_ft_detection
    au!
    au BufNewFile,BufRead *.gyp set filetype=json
    au BufNewFile,BufRead *.gyp syntax match Comment +\#.\+$+
aug end
"set flavor for vimtex, see :help vimtex-tex-flavor
let g:tex_flavor = "latex"

" set filetype for asm files
aug asm_ft_detection
    au!
    au BufNewFile,BufRead *.asm set filetype=nasm
    au BufNewFile,BufRead *.asm let g:ale_nasm_nasm_options = "-f elf64"
aug end

aug json_comment_syntax_setting
    au!
    au FileType json syntax match Comment +\/\/.\+$+
aug end

" vim -b : edit binary using xxd-format!
aug Binary
  au!
  au BufReadPre  *.bin let &bin=1
  au BufReadPost *.bin if &bin | %!xxd
  au BufReadPost *.bin set ft=xxd | endif
  au BufWritePre *.bin if &bin | %!xxd -r
  au BufWritePre *.bin endif
  au BufWritePost *.bin if &bin | %!xxd
  au BufWritePost *.bin set nomod | endif
aug end

" Autoformat on save for sh files
aug format_sh
  au!
  "use 2 spaces instead of tabs"
  let g:shfmt_extra_args = '-i 2'
  let g:shfmt_fmt_on_save = 1
aug end

" LaTeX
aug tex_settings
    au!
    au FileType tex g:vimtex_compiler_progname = "nvr"
    au FileType tex :noremap <leader>e i\emph{<C-c>wea}<C-c>
    au FileType tex set tw=180
aug end

" C
aug c_macros
    au!
    function! SwitchSourceHeader()
        "update!
        if (expand ("%:e") == "c")
            find %:t:r.h
        else
            find %:t:r.c
        endif
    endfunction
    au FileType c,cpp nnoremap <Space>s :call SwitchSourceHeader()<CR>
aug end
