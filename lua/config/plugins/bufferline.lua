return {
  'akinsho/bufferline.nvim',
  event = 'ColorScheme',
  config = function()
    require("bufferline").setup {
      highlights = require("catppuccin.special.bufferline").get_theme()
    }
  end
}
