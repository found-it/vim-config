--
-- Author : found-it
--   File : installer.lua
--

local lsp_installer = require('nvim-lsp-installer')

local api = vim.api
local cmd = vim.cmd


-- LSP settings
local on_attach = function(_, bufnr)
  api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap = true, silent = true }
  api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
  cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        },
        keymaps = {
            -- Keymap to expand a server in the UI
            toggle_server_expand = "<CR>",

            -- Keymap to install a server
            install_server = "i",

            -- Keymap to reinstall/update a server
            update_server = "u",

            -- Keymap to update all installed servers
            update_all_servers = "U",

            -- Keymap to uninstall a server
            uninstall_server = "X",
        },
    },
    -- install_root_dir = path.concat { vim.fn.stdpath "data", "lsp_servers" },
    max_concurrent_installers = 4,
})

local util = require("lspconfig/util")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {
      on_attach = on_attach,
      capabilities = capabilities,
    }

    -- (optional) Customize the options passed to the server
    if server.name == "pyright" then
      opts.settings = {
        pylsp = {
          plugins = {
            jedi_completion = {
              include_params = true,
            },
          },
        },
      }
    elseif server.name == "pyright" then
        opts.handlers = {
          -- pyright ignores dynamicRegistration settings
          ['client/registerCapability'] = function(_, _, _, _)
            return {
              result = nil;
              error = nil;
            }
          end
        };
        opts.root_dir = function(fname)
          return util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
            util.path.dirname(fname)
        end
    --     end
    end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)

-- Include the servers you want to have installed by default below
local servers = {
  "gopls",        -- Golang
  "pylsp",        -- Python
  "pyright",      -- Python
  "yamlls",       -- Yaml
  "sumneko_lua",  -- Lua
  "jsonls",       -- JSON
  "dockerls",     -- Docker
  "zk",           -- Markdown
  "terraformls",  -- Terraform
}

for _, name in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  end
end
