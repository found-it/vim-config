--
-- Author : found-it
--   File : init.lua
--

vim.g.mapleader = ","

require('options')
require('plugins')

local api = vim.api
local cmd = vim.cmd

-- colorscheme settings
-- cmd 'silent! colorscheme monokai_pro'
cmd 'silent! colorscheme space-vim-dark'
cmd 'hi Comment    cterm=italic'
cmd 'hi Normal     ctermbg=NONE guibg=NONE'
cmd 'hi LineNr     ctermbg=NONE guibg=NONE'
cmd 'hi SignColumn ctermbg=NONE guibg=NONE'

-- key mappings: telescope
api.nvim_set_keymap('', ';ff', ':Telescope find_files<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('', ';fg', ':Telescope live_grep<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('', ';fb', ':Telescope buffers<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('', ';fh', ':Telescope help_tags<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('', ';fd', ':Telescope git_status<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('', ';fs', ':Telescope current_buffer_fuzzy_find<CR>', {noremap = true, silent = true})

-- key mappings: tree
api.nvim_set_keymap('', 't', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- key mappings: blankline
api.nvim_set_keymap('', '|', ':IndentBlanklineToggle<CR>', {noremap = true, silent = true})

-- Remove all whitespace on save
api.nvim_command([[autocmd BufWritePre * %s/\s\+$//e]])

-- Set spacing to 2 for specific file types
api.nvim_command([[autocmd Filetype md setlocal ts=2 sw=2 sts=2 et ai]])
api.nvim_command([[autocmd Filetype lua setlocal ts=2 sw=2 sts=2 et ai]])
api.nvim_command([[autocmd FileType tf setlocal ts=2 sw=2 sts=2 et ai]])
api.nvim_command([[autocmd FileType json setlocal ts=2 sw=2 sts=2 et ai]])
api.nvim_command([[autocmd FileType sh setlocal ts=2 sw=2 sts=2 et ai]])

-- Use tabs in Makefiles
api.nvim_command([[autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0]])

-- Highlight on yank
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

