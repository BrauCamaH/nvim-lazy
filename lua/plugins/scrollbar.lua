return {
  "petertriho/nvim-scrollbar",
  config = function()
    local scrollbar = require("scrollbar")

    scrollbar.setup({
      throttle_ms = 0,
      handle = { color = "#44475a" },
      marks = {
        Cursor = { text = " " },
      },
      excluded_filetypes = { "snacks_picker_list" },
    })
  end,
}
