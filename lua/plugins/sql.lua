return {
  "tpope/vim-dadbod",
  "kristijanhusak/vim-dadbod-completion",
  {

    "kristijanhusak/vim-dadbod-ui",
    config = function()
      vim.keymap.set("n", ".d", ":DBUI <CR>", { desc = "Open Dadbod UI" })
    end,
  },
}
