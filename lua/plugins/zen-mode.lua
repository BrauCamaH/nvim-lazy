return {
  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.6, -- lighter dimming
        color = { "Normal", "#ffffff" },
        inactive = true,
      },
      context = 10,
      expand = {
        "function",
        "method",
        "class",
        "if_statement",
        "for_statement",
        "while_statement",
        "switch_statement",
        "table",
      },
    },
  },
  {
    "preservim/vim-pencil",
    ft = { "markdown", "text" },
  },
  {
    "folke/zen-mode.nvim",
    dependencies = {
      "folke/twilight.nvim",
      "preservim/vim-pencil",
    },
    ft = { "markdown", "text", "lua", "python", "typescript", "javascript" },
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 0.95,
          width = 80,
          height = 1,
          options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
            wrap = false,
            linebreak = true,
            colorcolumn = "",
          },
        },
        plugins = {
          options = {
            enabled = true,
            ruler = true,
            showcmd = false,
            laststatus = 0,
          },
          twilight = { enabled = false },
          gitsigns = { enabled = false },
          tmux = { enabled = true },
          wezterm = {
            enabled = true,
            font = "+20",
          },
        },
      })

      -- Force wrap settings and apply Twilight highlight on ZenMode enter
      vim.api.nvim_create_autocmd("User", {
        pattern = "ZenModeEnter",
        callback = function()
          vim.opt.wrap = true
          vim.opt.linebreak = true
          vim.opt.textwidth = 80
          vim.opt.colorcolumn = ""

          -- Set Twilight highlight for Nightfly theme
          vim.api.nvim_set_hl(0, "Twilight", {
            fg = "#7f8c99", -- subtle cool gray-blue
            blend = 20, -- slight transparency
            italic = true,
          })
        end,
      })
    end,
    keys = {
      {
        "<leader>z",
        desc = "Toggle Zen Mode with PencilSoft",
        function()
          vim.cmd("ZenMode")
          vim.cmd("PencilSoft")
        end,
      },
    },
  },
}
