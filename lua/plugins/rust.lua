return {
  {
    "rust-lang/rust.vim",
    ft = "rust", -- Only load for Rust files
    config = function()
      vim.g.rustfmt_autosave = 1 -- Enable auto-formatting on save
    end,
  },
}
