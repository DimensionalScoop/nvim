return {
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup()
    end,
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "diff view" },
      { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "file history" },
      -- XXX: this is still very hacky
      { "<leader>gx", "<cmd>DiffviewClose<cr>", desc = "close diff view" },
    },
  },
}
