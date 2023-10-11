--
-- Author : found-it
--   File : options.lua
--

local opt = vim.opt

opt.showmode = true
opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.autoindent = true
opt.smartindent = true
opt.showmatch = true

opt.tabstop = 4
opt.softtabstop = 4

opt.shiftwidth = 4
opt.expandtab = true
opt.backspace = {'indent', 'eol', 'start'}
opt.confirm = true
opt.mouse = 'a'
opt.cursorline = true
opt.wildmenu = true
opt.lazyredraw = true
opt.incsearch = true
opt.hlsearch = true
opt.termguicolors = true

--filetype indent on
