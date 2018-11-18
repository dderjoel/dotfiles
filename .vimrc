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

"enable the spellchecker
set nospell
"save some mappings for the thesis:
:let @L='A\begin{lstlisting}\end{lstlisting}kA'
:let @T='T i\texttt{f i}'

:map [11~ @T
