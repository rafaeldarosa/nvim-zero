local cmp = require("cmp")

cmp.setup({
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
    -- { name = "codeium" },
    -- add other sources you want here
  }),
  -- rest of your cmp configuration...
})
