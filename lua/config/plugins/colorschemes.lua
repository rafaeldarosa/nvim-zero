return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = false,
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
    opts = {
      styles = {
        bold = true,
        italic = true,
        transparency = true,
      }
    }
  },
  {
    "catppuccin/nvim", name = "catppuccin", priority = 1000, enabled = true
  },
}
