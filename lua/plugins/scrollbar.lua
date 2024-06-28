return {
  "petertriho/nvim-scrollbar",
  config = function()
    require("scrollbar").setup({
      throttle_ms = 0,
      marks = {
        Cursor = { text = "" },
        GitAdd = {
          text = "+",
          priority = 7,
          gui = nil,
          color = nil,
          cterm = nil,
          color_nr = nil, -- cterm
          highlight = "GitSignsAdd",
        },
        GitChange = {
          text = "*",
          priority = 7,
          gui = nil,
          color = nil,
          cterm = nil,
          color_nr = nil, -- cterm
          highlight = "GitSignsChange",
        },
        GitDelete = {
          text = "",
          priority = 7,
          gui = nil,
          color = nil,
          cterm = nil,
          color_nr = nil, -- cterm
          highlight = "GitSignsDelete",
        },
      },
      handlers = {
        gitsigns = true,
      },
    })
  end,
}
