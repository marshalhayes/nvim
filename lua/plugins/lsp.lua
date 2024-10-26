return {
    -- Main LSP Configuration
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      require('mason').setup()

      require('mason-tool-installer').setup({
        ensure_installed = { "lua_ls" }
      })

      require('mason-lspconfig').setup({
        handlers = {
          function(server_name)
            require('lspconfig')[server_name].setup({})
          end
        }
      })
    end
  }}
