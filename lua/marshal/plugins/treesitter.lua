return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "html", "css", "javascript", "typescript", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

      -- Automatically install languages as they're needed
      auto_install = true,

      highlight = {
        enable = true,

        -- Don't use regex for highlighting
        additional_vim_regex_highlighting = false,
      }
    }
  end
}
