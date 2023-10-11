--
-- Author : found-it
--   File : treesitter.lua
--

require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = {
    "astro",
    "beancount",
    "d",
    "elm",
    "elvish",
    "embedded_template",
    "foam",
    "fortran",
    "hack",
    "haskell",
    "help",
    "m68k",
    "org",
    "phpdoc",
    "proto",
    "qmljs",
    "rego",
    "rnoweb",
    "scheme",
    "slint",
    "swift",
    "tiger",
    "todotxt",
    "v",
    "verilog",
    "wgsl",
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  indent = {
    enable = true
  },
}

