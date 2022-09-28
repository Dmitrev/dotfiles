:set relativenumber
:set number 
let mapleader=" "

" Ctrl+C/Ctrl+V to copy/paste to/from system clipboard
nnoremap <C-C> "+yy
vnoremap <C-C> "+y
inoremap <C-V> <Esc>"+pa

" After yanking selected text return cursor to the last position before yank
vnoremap y ygv<Esc>
vnoremap > >gv
vnoremap < <gv


" Go to normal mode by press jk
inoremap jk <Esc>
vnoremap jk <Esc>

" Quick insert ; at the end of line
" inoremap ;; <Esc>A;<Esc>
" nnoremap ;; A;<Esc>

