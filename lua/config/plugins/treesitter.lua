return {
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
      -- WSL-specific configuration
      require("nvim-treesitter.install").compilers = { "gcc", "clang" }
      require("nvim-treesitter.install").prefer_git = false
      
      require("nvim-treesitter.configs").setup({
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = {
          "c",
          "cpp",
          "css",
          "go",
          "html",
          "javascript",
          "latex",
          "lua",
          "markdown",
          "markdown_inline",
          "norg",
          "python",
          "rust",
          "scss",
          "svelte",
          "tsx",
          "typescript",
          "typst",
          "vimdoc",
          "vim",
          "vue",
          "bash",
        },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = true,

        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<c-space>",
            node_incremental = "<c-space>",
            scope_incremental = "<c-s>",
            node_decremental = "<M-space>",
          },
        },
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context", }
}
