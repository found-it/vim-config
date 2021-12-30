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
return require('packer').startup(function()

  -- packer manages itself
  use 'wbthomason/packer.nvim'

  -- colorscheme
  use 'liuchengxu/space-vim-dark'

  -- fuzzy file finding
  use {
      'junegunn/fzf',
      dir = '~/.fzf',
      run = './install --all'
  }
  use 'junegunn/fzf.vim'

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
    -- { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
    -- { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
  }

  -- lsp
  use {
    'neovim/nvim-lspconfig',
    -- event = 'BufRead',
    config = function()
        require('plugins.lsp.servers')
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

  use 'lukas-reineke/indent-blankline.nvim'

  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('plugins.colorizer')
    end,
  }

end)
