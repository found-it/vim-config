--
-- Author : found-it
--   File : init.lua
--

require('options')
require('plugins')

local api = vim.api
local cmd = vim.cmd

-- set the colorscheme
cmd 'silent! colorscheme space-vim-dark'

-- config: fzf
api.nvim_set_keymap('', ';', ':Files<CR>', {noremap = true, silent = true})
api.nvim_set_keymap('', 't', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
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

