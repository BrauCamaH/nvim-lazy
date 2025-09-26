return {
  "mbbill/undotree",
  dependencies = { "nvim-lua/plenary.nvim" },
  ---@module 'undotree.collector'
  ---@type UndoTreeCollector.Opts
  opts = {
    -- your options
  },
  keys = { -- load the plugin only when using it's keybinding:
    { "<leader><F5>", "<cmd>lua require('undotree').toggle()<cr>" },
  },
}
