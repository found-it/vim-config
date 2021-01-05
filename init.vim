
"
" Load my vimrc
"

if exists('g:vscode')

else

    " Import the vimrc
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath=&runtimepath
    source ~/.dotfiles/vim-config/vimrc

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
    Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
    Plug 'xolox/vim-notes'
    Plug 'xolox/vim-misc'
    Plug 'cespare/vim-toml'
    Plug 'itchyny/vim-gitbranch'

    " Language specific
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'hashivim/vim-terraform'
    Plug 'leafgarland/typescript-vim'
    Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'

    " Colorschemes
    Plug 'sjl/badwolf'
    Plug 'fatih/molokai'
    Plug 'sainnhe/gruvbox-material'

    call plug#end()
    """""""""""""""""""""""""""
    "
    " End Plugins
    "
    """""""""""""""""""""""""""

    " Set the color scheme
    " let g:rehash256 = 1
    " let g:molokai_original = 1
    silent! color molokai
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


    " Language server configuration
    let g:LanguageClient_serverCommands = {
                \ 'cpp': ['cquery', '--log-file=/tmp/cq.log'],
                \ 'c': ['cquery', '--log-file=/tmp/cq.log'],
                \ }

    let g:LanguageClient_loadSettings = 1 " Use an absolute configuration path if you want system-wide settings
    let g:LanguageClient_settingsPath = '/home/parallels/.config/nvim/settings.json'
    set completefunc=LanguageClient#complete
    set formatexpr=LanguageClient_textDocument_rangeFormatting()

    nnoremap <silent> gh :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
    nnoremap <silent> gs :call LanguageClient#textDocument_documentSymbol()<CR>
    nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    " Language server configuration

    " Terraform Configs
    let g:terraform_align=1
    let g:terraform_fmt_on_save=1
    " Terraform Configs

    " Semshi Config
    nmap <silent> <leader>rr :Semshi rename<CR>
    nmap <silent> <leader>ee :Semshi error<CR>
    nmap <silent> <leader>ge :Semshi goto error<CR>
    " Semshi Config

endif
