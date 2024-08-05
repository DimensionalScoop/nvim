-- vim.g.lazyvim_python_lsp = "pyright"
-- vim.g.lazyvim_python_ruff = "ruff_lsp"

local plugins = {
  { "nvim-neotest/neotest-python" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    -- keys = {
    --   {
    --     "<leader>Tt",
    --     ":lua require('neotest').run.run()<CR>",
    --     desc
    --     mode = "n",
    --     noremap = true,
    --     silent = true,
    --   },
    --   {
    --     "<leader>TT",
    --     ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>",
    --     mode = "n",
    --     noremap = true,
    --     silent = true,
    --   },
    --   {
    --     "<leader>Ta",
    --     ":lua require('neotest').run.run(vim.fn.getcwd())<CR>",
    --     mode = "n",
    --     noremap = true,
    --     silent = true,
    --   },
    -- },
  },
  { -- semantic syntax highlighting
    "wookayin/semshi",
    ft = "python",
    build = ":UpdateRemotePlugins",
    version = "*", -- recommended to use the latest release
    init = function() -- example, skip if you're ok with the default config
      vim.g["semshi#error_sign"] = false
    end,
    config = function()
      -- any config or setup that would need to be done after plugin loading
    end,
  },
  { -- codi: notebook-like code running
    "metakirby5/codi.vim",
    cmd = "Codi",
    init = function()
      vim.g["codi#virtual_text_prefix"] = "\t󱉋 "
      vim.g["codi#virtual_text_pos"] = "eol"
    end,
  },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   opts = {},
  --   config = function(_, opts)
  --     require("lsp_signature").setup(opts)
  --   end,
  --   init = function()
  --     require("lsp_signature").on_attach()
  --   end,
  -- },
  -- {
  --   "ThePrimeagen/refactoring.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("refactoring").setup()
  --     require("telescope").load_extension("refactoring")
  --   end,
  -- },
  {
    "lukas-reineke/cmp-under-comparator", -- dunder methods at the end
  },
}

return plugins
