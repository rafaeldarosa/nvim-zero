return {
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  dependencies = {
    'NickvanDyke/opencode.nvim',  -- Ensure opencode is loaded before lualine
  },
  config = function()
    -- Safe loading of opencode module
    local has_opencode, opencode = pcall(require, 'opencode')

    -- Build sections configuration
    local sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      -- lualine_z = {'location'},
    }

    if not opencode.statusline then
      sections.lualine_z = {
        {
          function()
            return 'opencode not ok' 
          end
        }
      }
    end

    -- Add opencode statusline if available
    if has_opencode and opencode.statusline then
      sections.lualine_z = {
        {
          function()
            return 'opencode ok' 
          end
        }
      }
      sections.lualine_z = {
        {
          function()
            local ok, result = pcall(opencode.statusline)
            if ok then
              return result
            else
              return ''  -- Return empty string on error
            end
          end,
        },
      }
    end

    require('lualine').setup({
      options = {
        --- @usage 'rose-pine' | 'rose-pine-alt'
        -- theme = 'rose-pine',
        icons_enabled = true,
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        }
      },
      sections = sections,
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    })
  end
}
