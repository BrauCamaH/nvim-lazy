return {
  -- Lua
  {
    "preservim/vim-pencil",
  },
  {
    "folke/twilight.nvim",
    ft = "markdown",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    "folke/zen-mode.nvim",
    dependencies = {
      "folke/twilight.nvim",
      "preservim/vim-pencil",
    },
    ft = { "markdown", "text" }, -- optional: limit to filetypes
    config = function()
      require("zen-mode").setup({
        window = {
          backdrop = 0.95,
          width = 120,
          height = 1,
          options = {
            signcolumn = "no",
            number = false,
            relativenumber = false,
            wrap = true,
            linebreak = true,
          },
        },
        plugins = {
          options = {
            enabled = true,
            ruler = true,
            showcmd = false,
            laststatus = 0,
          },
          twilight = { enabled = true },
          gitsigns = { enabled = false },
          tmux = { enabled = true },
          wezterm = {
            enabled = true,
            font = "+20",
          },
        },
      })

      -- Force wrap and linebreak after ZenMode enters
      vim.api.nvim_create_autocmd("User", {
        pattern = "ZenModeEnter",
        callback = function()
          vim.opt.wrap = true
          vim.opt.linebreak = true
        end,
      })
    end,
    keys = {
      {
        "<leader>z",
        desc = "Toggle Zen Mode with Pencil",
        function()
          vim.cmd("ZenMode")
          vim.cmd("PencilSoft") -- soft wrap mode for writing
        end,
      },
    },
  },
}
