return {
  "crnvl96/lazydocker.nvim",
  opts = {},
  config = function()
    -- Default configuration
    require("lazydocker").setup({
      window = {
        settings = {
          width = 0.93, -- Percentage of screen width (0 to 1)
          height = 0.93, -- Percentage of screen height (0 to 1)
          border = "rounded", -- See ':h nvim_open_win' border options
          relative = "editor", -- See ':h nvim_open_win' relative options
        },
      },
    })
    vim.keymap.set({ "n", "t" }, "<leader>dd", "<Cmd>lua LazyDocker.toggle()<CR>")
  end,
}
