return {
  { -- Trouble: Also use telescope
    "folke/trouble.nvim",
    keys = {
      { "<leader>xx", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
      { "<leader>xX", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },
    },
  },
}
