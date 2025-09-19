return {
  {
    "rcarriga/nvim-notify",
    ops = {},
    config = function(_, opts)
      require("notify").setup(vim.tbl_extend("keep", {
        -- other stuff
        background_colour = "#000000",
      }, opts))
    end,
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      opts.presets.lsp_doc_border = true
    end,
  },
  {
    "nvim-mini/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },
}
