return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "echasnovski/mini.icons" },
  opts = {},

  keys = {
    {
      "<leader>oo",
      function()
        require("fzf-lua").files({ cwd = "~/Dropbox/zettelkasten/" })
      end,
      desc = "FIND FILE IN OBSIDIAN",
    },
    {
      "<leader>ow",
      function()
        require("fzf-lua").live_grep({ cwd = "~/Dropbox/zettelkasten/" })
      end,
      desc = "FIND WORD IN OBSIDIAN",
    },
    {
      "<leader>bs",
      function()
        require("fzf-lua").live_grep({ cwd = "~/Dropbox/Bible_Strongs/bible/" })
      end,
      desc = "FIND WORD IN STRONGS BIBLE",
    },
    {
      "<leader>bw",
      function()
        require("fzf-lua").grep_cword({ cwd = "~/Dropbox/Bible_Strongs/bible/" })
      end,
      desc = "FIND WORD UNDER CURSOR IN STRONGS BIBLE",
    },
    {
      "<leader>dd",
      function()
        require("fzf-lua").fzf_live("sdcv")
      end,
      desc = "OPEN DICTIONARY",
    },
    {
      "<leader>tt",
      function()
        require("fzf-lua").grep({
          search = "TODO|FIX",
          no_esc = true,
          cwd = "~/Dropbox/zettelkasten/JORNAL/",
        })
      end,
      desc = "SEARCH TODO'S - in daily-notes",
    },
    {
      "<leader>ti",
      function()
        require("fzf-lua").grep({
          search = "TODO|FIX",
          no_esc = true,
          cwd = "~/Dropbox/zettelkasten/000 INBOX/",
        })
      end,
      desc = "SEARCH TODO'S - INBOX",
    },
    {
      "<leader>tw",
      function()
        require("fzf-lua").grep({
          search = "TODO|FIX",
          no_esc = true,
          cwd = "~/Dropbox/zettelkasten/writing projects/",
        })
      end,
      desc = "SEARCH TODO'S - writing projects",
    },

    -- :lua require('fzf-lua').grep({search='TODO|HACK|PERF|NOTE|FIX', no_esc=true})
    {
      "<leader>dw",
      function()
        require("fzf-lua").grep_cword({ fzf_live("sdcv") })
      end,
      desc = "OPEN DICTIONARY in a WINDOW",
    },
  },
}
