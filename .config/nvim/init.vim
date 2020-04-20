" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
" Colour Scheme Plugins
Plug 'junegunn/seoul256.vim'
Plug 'simonsmith/material.vim'
Plug 'lifepillar/vim-gruvbox8'

" Airline Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Others
Plug 'tpope/vim-sensible'
" Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'simonsmith/material.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'vimwiki/vimwiki'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'preservim/nerdtree'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Show line numbers
set relativenumber number

let mapleader=' '
let maplocalleader='\'

set nocompatible
filetype plugin on
syntax on

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

" fzf-vim options
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'Type'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Character'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

set tabstop=4 shiftwidth=4 expandtab

set clipboard=unnamedplus

" Key mappings
" -------------------------------------------------- 

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

" Switch between splits
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j

" Switch between tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>


" Remove highlighting when exiting search
nnoremap <esc> :noh<return><esc>

" Nerdtree Config
" --------------------------------------------------
" Automatically start Nerdtree upon starting vim
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists(s:std_in) | NERDTree | endif
" autocmd vimenter * NERDTree

" Rebind to open and close NERDTree
nnoremap <Leader>f :NERDTreeToggle<Enter>

" Open NERDTree to the current file (NERDTreeFind)
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" Make it prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Delete the buffer of the file deleted in Nerdtree
let NERDTreeAutoDeleteBuffer = 1

" Close Nerdtree automatically upon opening a file
let NERDTreeQuitOnOpen = 1

" Automatically close tab if the only remaining window is Nerdtree
" autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | :endif

" Other autocmds
" -------------------------------------------------- 
" Prevent auto-commenting when inserting newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Markdown Preview 
" --------------------------------------------------
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = ''

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '${name}'

" Airline Settings
let g:airline_theme='ayu_mirage'
let g:airline_left_sep='>'
let g:airline_right_set='|'

"{{ Colour Schemes

" Unified color scheme (default: dark)
" color seoul256
" silent! colorscheme material
let g:gruvbox_italics=1
let g:gruvbox_italicize_strings=1
let g:gruvbox_filetype_hi_groups=0
let g:gruvbox_plugin_hi_groups=0
colorscheme gruvbox8

"}}

" Switch for background colors
" set background=dark
