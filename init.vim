"
" Author : James Petersen
"   File : init.vim
"

if exists('g:vscode')

else
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
    set scrolloff=5

    " File specific configs
    " autocmd FileType yaml,yml setlocal ts=2 sw=2 sts=2 et ai
    autocmd FileType tf setlocal ts=2 sw=2 sts=2 et ai
    autocmd FileType json setlocal ts=2 sw=2 sts=2 et ai
    autocmd FileType sh setlocal ts=2 sw=2 sts=2 et ai
    autocmd Filetype json colorscheme gruvbox-material
    autocmd Filetype md colorscheme gruvbox-material
    autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

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


    " Import the vimrc
    " set runtimepath^=~/.vim runtimepath+=~/.vim/after
    " let &packpath=&runtimepath
    " source ~/.dotfiles/vim-config/vimrc

    """""""""""""""""""""""""""
    "
    " Plugins
    "
    " Using vim-plug - https://github.com/junegunn/vim-plug
    "
    """""""""""""""""""""""""""
    call plug#begin('~/.vim/plugged')

    Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
    Plug 'itchyny/lightline.vim'
    Plug 'tomtom/tcomment_vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    Plug 'xolox/vim-notes'
    Plug 'xolox/vim-misc'
    Plug 'itchyny/vim-gitbranch'

    Plug 'dense-analysis/ale'

    " Requires node curl -sL install-node.now.sh/lts | bash
    " :CocInstall coc-yaml
    " :CocInstall coc-json
    " :CocInstall coc-pyright
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Language specific
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'hashivim/vim-terraform'
    Plug 'leafgarland/typescript-vim'
    Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
    Plug 'cespare/vim-toml'

    " Colorschemes
    Plug 'sjl/badwolf'
    Plug 'fatih/molokai'
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/gruvbox-material'
    Plug 'wadackel/vim-dogrun'
    Plug 'liuchengxu/space-vim-dark'

    call plug#end()
    """""""""""""""""""""""""""
    "
    " End Plugins
    "
    """""""""""""""""""""""""""

    " Set the color scheme
    " let g:rehash256 = 1
    " let g:molokai_original = 1
    silent! color space-vim-dark
    " silent! color molokai
    " silent! color dogrun
    " silent! color gruvbox
    " silent! color badwolf

    " FZF mods
    map ; :Files<CR>

    " Note taking mods
    map - :Note
    let g:notes_directories = ['~/notes/']

    " LightLine mods
    let g:lightline = {
                \     'colorscheme': 'molokai',
                \
                \     'active': {
                \         'left': [ ['mode', 'paste' ],
                \                   ['gitbranch', 'readonly', 'filename', 'modified'] ],
                \
                \         'right': [ ['lineinfo'],
                \                    ['percent'],
                \                    ['fileformat', 'fileencoding', 'hexchar'] ]
                \     },
                \     'component': {
                \         'hexchar': '0x%B'
                \     },
                \     'component_function': {
                \         'gitbranch': 'gitbranch#name'
                \     },
                \ }

    " Golang Configuration
    let g:go_highlight_types = 1
    let g:go_highlight_extra_types = 1

    let g:go_highlight_fields = 1
    let g:go_highlight_format_strings = 1
    let g:go_highlight_variable_declarations = 1
    let g:go_highlight_variable_assignments = 1

    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_function_parameters = 1

    let g:go_highlight_operators = 1
    let g:go_highlight_build_constraints = 1

    let g:go_highlight_array_whitespace_error = 1
    let g:go_highlight_chan_whitespace_error = 1
    let g:go_highlight_space_tab_error = 1
    " Golang Configuration

    " Terraform Configs
    let g:terraform_align=1
    let g:terraform_fmt_on_save=1
    " Terraform Configs

    " Semshi Config
    nmap <silent> <leader>rr :Semshi rename<CR>
    nmap <silent> <leader>ee :Semshi error<CR>
    nmap <silent> <leader>ge :Semshi goto error<CR>
    " Semshi Config

    " In ~/.vim/vimrc, or somewhere similar.
    let g:ale_linters = {
                \   'python': ['pylama'],
                \}
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    let g:ale_sign_error = 'E'
    let g:ale_sign_warning = 'W'
    " highlight ALEWarning ctermbg=DarkMagenta

    " coc Config
    " Use <c-space> to trigger completion.
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif
    " coc Config
endif
