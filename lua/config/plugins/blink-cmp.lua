return {
  -- add blink.compat
  {
    'saghen/blink.compat',
    -- use the latest release, via version = '*', if you also use the latest release for blink.cmp
    version = '*',
    -- lazy.nvim will automatically load the plugin when it's required by blink.cmp
    lazy = true,
    -- make sure to set opts so that lazy.nvim calls blink.compat's setup
    opts = {
      enabled_events = true,
    },
  },

  {
    'saghen/blink.cmp',
    enabled = true,
    -- optional: provides snippets for the snippet source
    dependencies = {
      'rafamadriz/friendly-snippets',
      -- "zbirenbaum/copilot.lua",
      -- { 'giuxtaposition/blink-cmp-copilot' },
      'Kaiser-Yang/blink-cmp-avante',
      { "saghen/blink.compat", opts = { impersonate_nvim_cmp = true } },
      {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        build = ":Codeium Auth",
        opts = { virtual_text = { enabled = true } },
      },
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },

    event = "BufReadPre",

    -- use a release tag to download pre-built binaries
    version = '*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = { preset = 'default' },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },
      sources = {
        default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },

        providers = {
          avante = {
            module = 'blink-cmp-avante',
            name = 'Avante',
            opts = {
              -- options for blink-cmp-avante
            }
          },
          lazydev = {
            name = "lazydev",
            module = "lazydev.integrations.blink",
            score_offset = 1000, -- show at a higher priority than lsp
          },

          -- copilot = {
          --   name = "copilot",
          --   module = "blink-cmp-copilot",
          --   score_offset = -1000,
          --   async = true,
          -- },

          -- codeium = {
          --   name = "codeium", -- IMPORTANT: use the same name as you would for nvim-cmp
          --   module = "blink.compat.source",
          --
          --   -- all blink.cmp source config options work as normal:
          --   --score_offset = -3,
          --
          --   opts = {
          --     -- options passed to the completion source
          --     -- equivalent to `option` field of nvim-cmp source config
          --
          --     cache_digraphs_on_start = true,
          --   },
          -- },
          --
        },
      },
      signature = { enabled = true }
    },

    trigger = {
      completion = {
        keyword_range = "full", -- full|prefix
      },
    },
    highlight = {
      use_nvim_cmp_as_default = true,
    },
  },
}
