set number relativenumber
set incsearch
set tabstop=4
set shiftwidth=4
set completeopt=longest,menuone
set ignorecase
set smartcase
set autoindent
set nofoldenable
set foldmethod=marker
set hidden
set mouse=a

call plug#begin('~/.vim/plugged')

Plug 'jpalardy/vim-slime', {'for': 'python'}

call plug#end()

let g:netrw_winsize = 30
let g:netrw_banner = 0

let mapleader = " "
set directory=~/.vim/swp//

nnoremap <silent> + :vertical resize +5<CR>
nnoremap <silent> - :vertical resize -5<CR>

inoremap ;g <Esc>/<++><CR>cgn
nnoremap gz f(lgf

" Python
let g:slime_target = "vimterminal"
let g:slime_python_ipython = 1

" LaTeX
autocmd FileType tex inoremap ;eqn \begin{equation}<CR>\end{equation}<Esc>O
autocmd FileType tex inoremap ;fig \begin{figure}[H]<CR>\centering<CR>\includegraphics[width=0.7\linewidth]{}<CR>\caption{}<CR>\label{fig:}<CR>\end{figure}<Esc>3k$i
autocmd FileType tex inoremap ;tab \begin{table}[H]<CR>\centering<CR>\begin{tabular}{\|c\|c\|c\|c\|} \hline<CR><++> & <++> & <++> & <++>\\[0.3em] \hline<CR><++> & <++> & <++> & <++>\\ \hline<CR>\end{tabular}<CR>\caption{}<CR>\label{tab:}<CR>\end{table}<Esc>5k$
autocmd FileType tex inoremap ;ite \begin{itemize}<CR>\item[-] <CR>\end{itemize}<Esc>kA
autocmd FileType tex inoremap ;fra \frac{}{<++>}<++><Esc>2F{a
autocmd FileType tex inoremap ;SI \SI{}{<++>}<++><Esc>2F{a
