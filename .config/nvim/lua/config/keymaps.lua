-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--Obsidian keymaps
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "Create New Note" })
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<CR>", { desc = "Insert Obsidian Template" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>", { desc = "Show Obsidian Backlinks" })
-- vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<CR>", { desc = "Search Obsidian notes" })
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { desc = "ZenMode toggle" })
vim.keymap.set("n", "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Obsidian Quick Switch to notes" })
vim.keymap.set("n", "<leader>od", "<cmd>ObsidianDailies<CR>", { desc = "Obsidian Daily notes" })
vim.keymap.set(
  "n",
  "<leader>td",
  "<cmd>:e ~/Dropbox/zettelkasten/000_To_Do/00_To_Do.md<CR>",
  { desc = "Open ToDo file" }
)
--obsidian tab backlinks
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "markdown",
--  callback = function()
--    vim.keymap.set("n", "<Tab>", "/\\(\\[\\[\\|\\[.\\{-}\\](\\)<CR>:nohlsearch<CR>", { buffer = true })
--    vim.keymap.set("n", "<S-Tab>", "?\\(\\[\\[\\|\\[.\\{-}\\](\\)<CR>:nohlsearch<CR>", { buffer = true })
--  end,
-- Define the function
local function output_to_new_buffer(cmd)
  local output = vim.api.nvim_exec(cmd, true)
  vim.cmd("new")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, "\n"))
end

-- Map a key to run `:version` and show it in a new buffer
vim.keymap.set("n", "<leader>ov", function()
  output_to_new_buffer("ObsidianBacklinks")
end, { desc = "Output Backlinks to new buffer" })
