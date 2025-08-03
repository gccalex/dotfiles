-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- Indentation

opt.smartindent = true
opt.wrap = true

---- Important Grammar and spell check
opt.spelllang = { "en", "ru", "pl" }
opt.spell = true
--
--theme
opt.guicursor = "n:block-nCursor,v:block-vCursor,i:ver25-iCursor,r:hor25-rCursor,c:ver25-cCursor"
opt.background = "dark" -- or "light" for light mode
--
-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.completeopt = "menuone,noselect"

-- marksman
-- vim.lsp.enable("marksman")
