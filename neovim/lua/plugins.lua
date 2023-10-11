--
-- Author : found-it
--   File : plugins.lua
--

-- Bootstrap packer if needed
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- Define plugins
return require('packer').startup(function(use)

  -- packer manages itself
  use 'wbthomason/packer.nvim'

  --
  --
  -- colorschemes
  --
  --
  use 'liuchengxu/space-vim-dark'
  use 'tanvirtin/monokai.nvim'
  use 'catppuccin/nvim'
  use 'Mofiqul/vscode.nvim'

  -- https://github.com/sainnhe/sonokai
  use 'sainnhe/sonokai'

  -- https://github.com/rebelot/kanagawa.nvim
  use "rebelot/kanagawa.nvim"

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'meliora-theme/neovim',
    requires = {'rktjmp/lush.nvim'},
    config = function()
      require('plugins.meliora')
    end,
  }

  -- multi-line stuff
  use {
      'mg979/vim-visual-multi',
      branch = 'master'
  }

  -- visual line commenting
  use 'tomtom/tcomment_vim'

  -- use {
  --   "blackCauldron7/surround.nvim",
  --   config = function()
  --     require"surround".setup {mappings_style = "sandwich"}
  --   end
  -- }

  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      require('plugins.lualine')
    end,
  }

  use {
      'nvim-treesitter/nvim-treesitter',
        -- event = 'CursorHold',
        run = ':TSUpdate',
        config = function()
            require('plugins.treesitter')
        end,
  }

  -- lsp
  -- use {
  --   'neovim/nvim-lspconfig',
  --   -- event = 'BufRead',
  --   config = function()
  --       require('plugins.lsp.servers')
  --   end,
  -- }

  -- use {
  --   'williamboman/nvim-lsp-installer',
  --   config = function()
  --       require('plugins.lsp.installer')
  --   end,
  -- }

  -- Autocompletion plugin
  -- use 'hrsh7th/nvim-cmp'
  --
  -- -- LSP source for nvim-cmp
  -- use 'hrsh7th/cmp-nvim-lsp'
  --
  -- -- Snippets source for nvim-cmp
  -- use 'saadparwaiz1/cmp_luasnip'
  --
  -- -- Snippets plugin
  -- use 'L3MON4D3/LuaSnip'
  --
  -- use {
  --   'norcalli/nvim-colorizer.lua',
  --   config = function()
  --     require('colorizer').setup()
  --   end,
  -- }

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function()
      require('nvim-tree').setup({
        diagnostics = {
            enable = true,
        },
        update_focused_file = {
            enable = true,
        },
        view = {
            width = 35,
            side = 'left',
        },
        filters = {
            custom = { '.git', 'node_modules' },
        },
        git = {
            ignore = false,
        },
      })
    end
  }

  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
        require("plugins.null")
    end,
    requires = { "nvim-lua/plenary.nvim" },
  })


end)
