return {
  { "shortcuts/no-neck-pain.nvim", version = "*" },
  {
    "tzachar/local-highlight.nvim",
    config = function()
      require("local-highlight").setup()
    end,
  },
}
