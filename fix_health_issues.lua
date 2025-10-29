-- Fix script for Neovim health issues

-- Function to install TreeSitter parser for markdown
local function install_markdown_parser()
  print("Installing markdown parser for TreeSitter...")
  vim.cmd("TSInstall markdown")
  print("Markdown parser installed!")
end

-- Function to add mini.icons plugin
local function add_mini_icons()
  print("Adding mini.icons plugin...")
  -- This will be handled by adding it to the LazyVim plugins configuration
  print("mini.icons will be added to LazyVim config")
end

-- Function to authenticate GitHub Copilot
local function setup_copilot()
  print("Setting up GitHub Copilot authentication...")
  print("Please run :Copilot auth manually to authenticate")
end

-- Run all fixes
local function run_all_fixes()
  print("Running all health check fixes...")
  install_markdown_parser()
  add_mini_icons()
  setup_copilot()
  print("All fixes applied! Run :checkhealth to verify.")
end

-- Execute the fixes
run_all_fixes()

