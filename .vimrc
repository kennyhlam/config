" Better safe than sorry? http://stackoverflow.com/questions/5845557/in-a-vimrc-is-set-nocompatible-completely-useless
set nocompatible

" ---- Vim Package Manager: Vundle ----
"   alternatives:
"     https://github.com/Shougo/neobundle.vim
"     https://github.com/junegunn/vim-plug
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
call vundle#end()
filetype plugin indent on

" ---- Plugin Settings ----

" ----- bling/vim-airline settings -----
" Always show statusbar
set laststatus=2
" Fancy arrows requires a patched font
"   https://github.com/abertsch/Menlo-for-Powerline
let g:airline_powerline_fonts = 1
" Show PASTE if in paste mode
let g:airline_detect_paste=1
" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

" ----- jistr/vim-nerdtree settings -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
" To have NERDTree always open on startup
let g:nerdtree_tabs_open_on_console_startup = 1

" ---- General Settings ----
set backspace=indent,eol,start
set number
set ruler
set showcmd
set incsearch
set hlsearch
syntax on
set mouse=a

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
nnoremap <C-k> <C-w><C-h>
nnoremap <C-j> <C-w><C-l>
set splitbelow
set splitright

" switching tabs
nnoremap <C-h> gT
nnoremap <C-l> gt

cnoreabbrev reset e!
cnoreabbrev open e
cnoreabbrev tab tabe
cnoreabbrev ls Te
cnoremap cd lcd 

