-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- Indentation

opt.smartindent = true
opt.wrap = true
opt.textwidth = 80
opt.linebreak = true
---- Important Grammar and spell check
opt.spelllang = { "en", "ru", "pl" }
opt.spell = true
-- opt.relativenumber = false
-- opt.number = false
--theme
-- opt.guicursor = "n:block-nCursor,v:block-vCursor,i:ver25-iCursor,r:hor25-rCursor,c:ver25-cCursor"
-- opt.background = "dark" -- or "light" for light mode
--
-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.completeopt = "menuone,noselect"

-- marksman
-- vim.lsp.enable("marksman")
-- Function to translate the word under cursor using sdcv
local function translate_word()
  local word = vim.fn.expand("<cword>")
  local cmd = "sdcv -n --utf8-output " .. vim.fn.shellescape(word)
  local output = vim.fn.systemlist(cmd)

  if #output == 0 then
    output = { "No translation found." }
  end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)

  local width = math.max(50, math.floor(vim.o.columns * 0.5))
  local height = math.min(#output, 20)
  local row = math.floor((vim.o.lines - height) / 2 - 1)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create floating window and store the window ID
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = "rounded",
  })

  -- Set buffer options
  vim.api.nvim_buf_set_option(buf, "buftype", "nofile")
  vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")
  vim.api.nvim_buf_set_option(buf, "modifiable", false)
  vim.api.nvim_buf_set_option(buf, "filetype", "sdcv")

  -- Map 'q' in the floating window buffer to close the window
  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, nowait = true, silent = true })
end

-- Example keymap
vim.keymap.set("n", "<leader>dw", translate_word, { desc = "TRANSL. WORD UNDER CURSOR" })
