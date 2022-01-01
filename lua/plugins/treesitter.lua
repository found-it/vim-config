--
-- Author : found-it
--   File : treesitter.lua
--

require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  sync_install = false,
  ignore_install = {
      "beancount"
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true
  },
}

