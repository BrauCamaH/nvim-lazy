return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {

      dashboard = {
        ---@class snacks.dashboard.Config
        {
          width = 60,
          row = nil, -- dashboard position. nil for center
          col = nil, -- dashboard position. nil for center
          pane_gap = 4, -- empty columns between vertical panes
          autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
          -- These settings are used by some built-in sections
          preset = {
            -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
            ---@type fun(cmd:string, opts:table)|nil
            pick = nil,

            -- Used by the `header` section
            header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
          },
          sections = {
            { section = "header" },
            { section = "keys", gap = 1, padding = 1 },
            { section = "startup" },
          },
        },
      },

      bigfile = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
}
