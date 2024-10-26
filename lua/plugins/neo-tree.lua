return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require('neo-tree').setup({
      filesystem = {
        use_libuv_file_watcher = true
      },

      hijack_netrw_behavior = true,

      -- Don't use the space mapping in neotree since we're using it as our leader
      window = {
        mappings = {
          ['<space>'] = 'none'
        }
      }
    })

    vim.api.nvim_set_keymap('n', '\\', ':Neotree reveal<CR>', { noremap = true, silent = true })
  end
}
