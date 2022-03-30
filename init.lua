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
-- cmd 'silent! colorscheme catppuccin'
-- cmd 'silent! colorscheme vscode'
-- cmd 'silent! colorscheme space-vim-dark'
-- cmd 'silent! colorscheme monokai_pro'
cmd 'silent! colorscheme kanagawa'
cmd 'hi Comment    cterm=italic'
cmd 'hi Normal     ctermbg=NONE guibg=NONE'
cmd 'hi LineNr     ctermbg=NONE guibg=NONE'
cmd 'hi SignColumn ctermbg=NONE guibg=NONE'

-- sonokai colorscheme settings
vim.g.sonokai_style = "default"
vim.g.sonokai_transparent_background = 1
vim.g.sonokai_enable_italic = 1

-- vscode colorscheme settings
vim.g.vscode_style = "dark"
vim.g.vscode_transparent = 1
vim.g.vscode_italic_comment = 1
vim.g.vscode_disable_nvimtree_bg = true

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
api.nvim_command([[autocmd FileType md setlocal ts=2 sw=2 sts=2 et ai colorscheme=sonokai]])
api.nvim_command([[autocmd BufEnter *.md silent! colorscheme sonokai]])

api.nvim_command([[autocmd FileType lua setlocal ts=2 sw=2 sts=2 et ai]])
api.nvim_command([[autocmd FileType tf setlocal ts=2 sw=2 sts=2 et ai]])
api.nvim_command([[autocmd FileType hcl setlocal ts=2 sw=2 sts=2 et ai]])
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


-- if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
--   vim.diagnostic.disable()
-- end

-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]

-- vim.cmd [[
--   highlight! DiagnosticLineNrError guibg=#51202A guifg=#FF0000 gui=bold
--   highlight! DiagnosticLineNrWarn guibg=#51412A guifg=#FFA500 gui=bold
--   highlight! DiagnosticLineNrInfo guibg=#1E535D guifg=#00FFFF gui=bold
--   highlight! DiagnosticLineNrHint guibg=#1E205D guifg=#0000FF gui=bold
--
--   sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
--   sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
--   sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
--   sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
-- ]]
