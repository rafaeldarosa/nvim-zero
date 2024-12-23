return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type oil.SetupOpts
  opts = {
    keymaps = {
      ["<C-h>"] = false,
    },
    view_optios = {
      show_hidden = true,
    }
  },
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}
