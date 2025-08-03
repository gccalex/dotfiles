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

--obsidian tab backlinks
--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "markdown",
--  callback = function()
--    vim.keymap.set("n", "<Tab>", "/\\(\\[\\[\\|\\[.\\{-}\\](\\)<CR>:nohlsearch<CR>", { buffer = true })
--    vim.keymap.set("n", "<S-Tab>", "?\\(\\[\\[\\|\\[.\\{-}\\](\\)<CR>:nohlsearch<CR>", { buffer = true })
--  end,
