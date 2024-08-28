return {
  { "shortcuts/no-neck-pain.nvim", version = "*" },
  {
    "tzachar/local-highlight.nvim",
    enabled = false,
    config = function()
      require("local-highlight").setup()
    end,
  },
}
