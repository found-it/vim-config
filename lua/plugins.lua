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

  -- colorschemes
  use 'liuchengxu/space-vim-dark'
  use 'tanvirtin/monokai.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- multi-line stuff
  use {
      'mg979/vim-visual-multi',
      branch = 'master'
  }

  -- visual line commenting
  use 'tomtom/tcomment_vim'

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
  --   'neoclide/coc.nvim',
  --   branch = 'release',
  -- }
  use {
    'neovim/nvim-lspconfig',
    -- event = 'BufRead',
    config = function()
        require('plugins.lsp.servers')
    end,
  }

  use {
    'williamboman/nvim-lsp-installer',
    config = function()
        require('plugins.lsp.installer')
    end,
  }

  -- Autocompletion plugin
  use 'hrsh7th/nvim-cmp'

  -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'

  -- Snippets source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip'

  -- Snippets plugin
  use 'L3MON4D3/LuaSnip'

  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.blankline')
    end,
  }

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  }

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


end)
