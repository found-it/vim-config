
"
" Load my vimrc
"
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vim/vim-config/vimrc

"""""""""""""""""""""""""""
"
" Plugins
"
" Using vim-plug
"       https://github.com/junegunn/vim-plug
"
"""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Enhanced
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sjl/badwolf'
Plug 'itchyny/lightline.vim'
Plug 'tomtom/tcomment_vim'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'cespare/vim-toml'

call plug#end()
"""""""""""""""""""""""""""
"
" End Plugins
"
"""""""""""""""""""""""""""

" Set the color scheme
silent! color badwolf

" FZF mods
map ; :Files<CR>

" Note taking mods
map - :Note
let g:notes_directories = ['~/notes/']

" LightLine mods
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'filename', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }


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
