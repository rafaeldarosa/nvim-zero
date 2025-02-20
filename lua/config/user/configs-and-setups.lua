-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

-- [[ Configure Telescope ]]
require("telescope").setup({
  -- See `:help telescope` and `:help telescope.setup()`
  defaults = {
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-d>"] = false,
      },
    },
  },
  extensions = {
    fzf = {}
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
    live_grep = {
      theme = "ivy",
    },
    grep_string = {
      theme = "ivy",
    },
    builtin = {
      theme = "ivy",
    },
  },
})

-- Enable telescope fzf native, if installed
pcall(require("telescope").load_extension, "fzf")

--pcall(require("telescope").load_extension, "noice")

-- Telescope live_grep in git root
-- Function to find the git root directory based on the current buffer's path
local function find_git_root()
  -- Use the current buffer's path as the starting point for the git search
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir
  local cwd = vim.fn.getcwd()
  -- If the buffer is not associated with a file, return nil
  if current_file == "" then
    current_dir = cwd
  else
    -- Extract the directory from the current file's path
    current_dir = vim.fn.fnamemodify(current_file, ":h")
  end

  -- Find the Git root directory from the current file's path
  local git_root = vim.fn.systemlist("git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel")[1]
  if vim.v.shell_error ~= 0 then
    print("Not a git repository. Searching on current working directory")
    return cwd
  end
  return git_root
end

-- Custom live_grep function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require("telescope.builtin").live_grep({
      search_dirs = { git_root },
    })
  end
end

vim.api.nvim_create_user_command("LiveGrepGitRoot", live_grep_git_root, {})

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
-- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
-- vim.defer_fn(function()
-- 	require("nvim-treesitter.configs").setup({
-- 		-- Add languages to be installed here that you want installed for treesitter
-- 		ensure_installed = {
-- 			"c",
-- 			"cpp",
-- 			"go",
-- 			"lua",
-- 			"python",
-- 			"rust",
-- 			"tsx",
-- 			"javascript",
-- 			"typescript",
-- 			"vimdoc",
-- 			"vim",
-- 			"bash",
-- 		},
--
-- 		-- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
-- 		auto_install = true,
--
-- 		highlight = { enable = true },
-- 		indent = { enable = true },
-- 		incremental_selection = {
-- 			enable = true,
-- 			keymaps = {
-- 				init_selection = "<c-space>",
-- 				node_incremental = "<c-space>",
-- 				scope_incremental = "<c-s>",
-- 				node_decremental = "<M-space>",
-- 			},
-- 		},
-- 		textobjects = {
-- 			select = {
-- 				enable = true,
-- 				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
-- 				keymaps = {
-- 					-- You can use the capture groups defined in textobjects.scm
-- 					["aa"] = "@parameter.outer",
-- 					["ia"] = "@parameter.inner",
-- 					["af"] = "@function.outer",
-- 					["if"] = "@function.inner",
-- 					["ac"] = "@class.outer",
-- 					["ic"] = "@class.inner",
-- 				},
-- 			},
-- 			move = {
-- 				enable = true,
-- 				set_jumps = true, -- whether to set jumps in the jumplist
-- 				goto_next_start = {
-- 					["]m"] = "@function.outer",
-- 					["]]"] = "@class.outer",
-- 				},
-- 				goto_next_end = {
-- 					["]M"] = "@function.outer",
-- 					["]["] = "@class.outer",
-- 				},
-- 				goto_previous_start = {
-- 					["[m"] = "@function.outer",
-- 					["[["] = "@class.outer",
-- 				},
-- 				goto_previous_end = {
-- 					["[M"] = "@function.outer",
-- 					["[]"] = "@class.outer",
-- 				},
-- 			},
-- 			swap = {
-- 				enable = true,
-- 				swap_next = {
-- 					["<leader>a"] = "@parameter.inner",
-- 				},
-- 				swap_previous = {
-- 					["<leader>A"] = "@parameter.inner",
-- 				},
-- 			},
-- 		},
-- 	})
-- end, 0)
