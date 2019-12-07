" Vim plug block
call plug#begin('~/.vim/plugged')

Plug 'simonsmith/material.vim'

Plug 'junegunn/vim-easy-align'

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

Plug 'mcchrish/nnn.vim'

Plug 'jlanzarotta/bufexplorer'

Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-repeat'

Plug 'tomtom/tcomment_vim'

Plug 'matze/vim-move'

Plug 'terryma/vim-multiple-cursors'

Plug 'chaoren/vim-wordmotion'

Plug 'psliwka/vim-smoothie'

" Improve pasting code from clipboard
Plug 'ConradIrwin/vim-bracketed-paste'

Plug 'vim-airline/vim-airline'

Plug 'gcmt/taboo.vim'

Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

call plug#end()

set background=dark
silent! colorscheme material

let mapleader=' '
let maplocalleader='\'

set noswapfile
set nobackup
set nowb

set binary

set termguicolors

set textwidth=100

set foldmethod=indent
set nofoldenable

set hidden

set cursorline

set softtabstop=4
set tabstop=4
set shiftwidth=4

set expandtab

set noshowmode

set splitbelow
set splitright

set ignorecase
set smartcase

" Need to check if vim comes with clipboard support
" vim --version shows it up
" look for +clipboard and +xterm_clipboard
" otherwise, install vim-gtk or vim-gnome (Ubuntu/Debian) or vim-X11 (Debian)
set clipboard=unnamedplus

set ttimeoutlen=0

set title

set showcmd

set number
set relativenumber

" Key mappings
" --------------------------------------------

nnoremap k gk
nnoremap j gj
vnoremap k gk
vnoremap j gj

nnoremap Y y$

" Switch buffers
nnoremap <silent>H :silent bp<CR>
nnoremap <silent>L :silent bn<CR>

" Clear search
nnoremap <silent> <leader>k :noh<cr>

vnoremap < <gv
vnoremap > >gv

inoremap kj <esc>
cnoremap kj <C-C>
