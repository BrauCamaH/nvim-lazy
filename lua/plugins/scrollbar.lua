return {
  "petertriho/nvim-scrollbar",
  config = function()
    require("scrollbar").setup({
      throttle_ms = 0,
      handle = { color = "#44475a" },
      marks = {
        Cursor = { text = " " },
      },
    })
  end,
}
