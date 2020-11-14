"
"   Author  - James Petersen
"            ___    ___
"            \  \  /  / __  __ _ __ __
"             \  \/  /_)  \/  | '__) _|
"   File    -  \    /| | |\/| | |(  (_
"               \__/ |_|_|  |_| | \___|
"--------------------------------------------------------

autocmd BufNewFile,BufRead *.tex set filetype=tex
autocmd BufWritePre * %s/\s\+$//e

set showmode
set number relativenumber

set splitbelow
set splitright

" Syntax
syntax on
syntax enable

" Visual Stuff
set background=dark
colorscheme desert

" File specific configs
autocmd FileType yaml,yml setlocal ts=2 sw=2 sts=2 et ai
autocmd FileType tf setlocal ts=2 sw=2 sts=2 et ai

" Indentation
set autoindent
set smartindent
set showmatch

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set backspace=indent,eol,start
set confirm
set mouse=a

set cursorline
filetype indent on

set wildmenu
set lazyredraw

set incsearch
set hlsearch

let mapleader=','

"Remove all trailing whitespace by pressing F5.
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
nnoremap <leader><space> :nohlsearch<CR>
inoremap jk <esc>
nnoremap <C-n> <C-w>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
