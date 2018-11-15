"enable the current line number plus relative numbers above and below
set number
set number relativenumber

"enable syntax highlighting
syntax on

"enable indentation based on current line when pressing enter
set smartindent

"set color scheme
colo desert

"Remap capital Q to also close the terminal
:command! -bar -bang Q quit<bang>

"enable the spellchecker
set spell
"save some mappings for the thesis:
:let @Q='A\begin{lstlisting}^M^M\end{lstlisting}^[kA'
