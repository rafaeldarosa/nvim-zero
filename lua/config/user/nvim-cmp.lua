local cmp = require("cmp")

cmp.setup({
  sources = cmp.config.sources({
    { name = "codeium" },
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    -- add other sources you want here
  }),
  -- rest of your cmp configuration...
})
