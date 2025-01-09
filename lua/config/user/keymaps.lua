vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

local function telescope_live_grep_open_files()
  require("telescope.builtin").live_grep({
    grep_open_files = true,
    prompt_title = "Live Grep in Open Files",
  })
end

vim.keymap.set("n", "<leader>s/", telescope_live_grep_open_files, { desc = "[S]earch [/] in Open Files" })
vim.keymap.set("n", "<leader>ss", require("telescope.builtin").builtin, { desc = "[S]earch [S]elect Telescope" })
vim.keymap.set("n", "<leader>gf", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })

--vim.keymap.set("n", "<leader>sG", ":LiveGrepGitRoot<cr>", { desc = "[S]earch by [G]rep on Git Root" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })

-- neovim config
vim.keymap.set("n", "<leader>sc", function()
  require("telescope.builtin").find_files {
    cwd = vim.fn.stdpath("config")
  }
end)

-- Exit insert mode fast
vim.keymap.set("i", "jk", "<Esc>", {})

vim.keymap.set("i", "kj", function()
  -- "Write" saves regardless of whether the buffer has been modified or not
  -- vim.cmd("write")
  -- "Update" saves only if the buffer has been modified since the last save
  -- Suggested in reddit by user @SeoCamo
  vim.cmd("update")
  -- Move to the right
  vim.cmd("normal l")
  -- Switch back to command mode after saving
  vim.cmd("stopinsert")
  -- Print the "File saved" message and the file path
  print("FILE SAVED: " .. vim.fn.expand("%:p"))
end, { desc = "Write current file and exit insert mode" })

--Neovide copy paste
vim.keymap.set("v", "<D-c>", '"+y', { silent = true })
vim.keymap.set("i", "<D-v>", '<C-o>"+p', { silent = true })
vim.keymap.set("n", "<D-v>", '"+p', { silent = true })
vim.keymap.set("v", "<D-v>", '"+p', { silent = true })

-- Move windows with vim motions
vim.keymap.set("n", "<C-L>", "<C-W><C-L>")
vim.keymap.set("n", "<C-H>", "<C-W><C-H>")
vim.keymap.set("n", "<C-J>", "<C-W><C-J>")
vim.keymap.set("n", "<C-K>", "<C-W><C-K>")

-- Actions on windows
vim.keymap.set("n", "<C-w>", "<cmd>:close<CR>")

-- Center cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Automatic replace from selected word
vim.keymap.set("n", "<leader>rp", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv")

-- Save on Ctrl S
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>:w<CR>")

-- Bufferline keymaps
vim.keymap.set("n", "<S-l>", "<cmd>:BufferLineCycleNext<CR>", { silent = true })
vim.keymap.set("n", "<S-h>", "<cmd>:BufferLineCyclePrev<CR>", { silent = true })

vim.keymap.set("n", "<leader>bd", "<cmd>:bd<CR>", { silent = true })
vim.keymap.set("n", "<leader>bo", "<cmd>:BufferLineCloseOthers<CR>", { silent = true })

-- Oil
vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

-- Codeium
--TODO: test codeium options
--vim.keymap.set("n", "<leader>]", require("codeium.virtual_text").complete(), { silent = true })
-- Codeium command to toggle codeium
vim.keymap.set("n", "<leader>cc", "<cmd>:Codeium Chat<CR>", { silent = true })

-- Todo comments
vim.keymap.set("n", "<leader>td", "<cmd>:TodoTelescope keywords=TODO,FIX<CR>", { desc = "Open Todo Telescope" })

-- Terminal
--
-- create an autocmd on TermOpen to remove numbers and relative numbers
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.terminal()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 10)
end)
