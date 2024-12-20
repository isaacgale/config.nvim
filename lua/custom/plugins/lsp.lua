return {
  {'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'saghen/blink.cmp',

    { 'j-hui/fidget.nvim', opts = {} },

    'folke/neodev.nvim',
  },
  config = function()

    require('mason').setup()
    require('mason-lspconfig').setup()

    local servers = {
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
          -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
          diagnostics = { disable = { 'missing-fields' } },
        },
      },
    }

    -- Setup neovim lua configuration
    require('neodev').setup()

    local capabilities = require('blink.cmp').get_lsp_capabilities()

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    local on_attach = function(client, bufnr)
      require('config.lspkeymaps').on_attach(client, bufnr)
    end

    local handlers = {

      function(server_name)
        require('lspconfig')[server_name].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = servers[server_name],
        filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
      ["jdtls"] = function() -- ignore Jdtls here see jdtls.lua
      end
      }

      mason_lspconfig.setup_handlers(handlers)
      end
    }
}

-- vim: ts=2 sts=2 sw=2 et
