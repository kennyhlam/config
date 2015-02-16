set number
syntax on
set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces
set autochdir

inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0

nnoremap <C-e> $
nnoremap <C-a> 0
" scroll up and down
" nnoremap <C-k> <C-f>
" nnoremap <C-l> <C-b> 

" switching panes for vert splits
nnoremap <C-j> <C-w><C-h>
nnoremap <C-k> <C-w><C-l>
" switching tabs
nnoremap <C-h> gT
nnoremap <C-l> gt

cnoreabbrev reset e!
cnoreabbrev open e
cnoreabbrev tab tabe
cnoreabbrev ls Te
cnoremap cd lcd 
