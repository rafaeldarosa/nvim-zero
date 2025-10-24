return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    -- Configure with defaults (spawns Claude Code CLI in a terminal split)
    opts = {
      terminal_cmd = "/Users/rafael/.local/state/fnm_multishells/9881_1761314676621/bin/claude",
    },
    config = true,
    -- Use <leader>l for Claude Code and provide which-key friendly labels
    keys = {
      { "<leader>l",  nil,                              desc = "Claude Code" },
      { "<leader>lc", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
      { "<leader>lf", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
      { "<leader>lr", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
      { "<leader>lC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
      { "<leader>lm", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
      { "<leader>lb", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add current buffer" },
      { "<leader>ls", "<cmd>ClaudeCodeSend<cr>",        mode = "v",                  desc = "Send selection" },
      {
        "<leader>ls",
        "<cmd>ClaudeCodeTreeAdd<cr>",
        desc = "Add file",
        ft = { "NvimTree", "neo-tree", "oil", "minifiles" },
      },
      -- Diff management
      { "<leader>la", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
      { "<leader>ld", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Deny diff" },
    },
  },
}
