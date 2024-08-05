return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      document_highlight = { enabled = true },
      inlay_hints = { enabled = true },
      -- LSP Server Settings
      ---@type lspconfig.options
      servers = {
        ltex = {
          filetypes = { "asciidoc", "tex", "bib", "plaintex", "markdown", "lsp_markdown" },
        },
        pylsp = { enabled = true },
        ruff = { enabled = true },
        jedi_language_server = { enabled = true },
        basedpyright = {
          enabled = false,
          settings = {
            basedpyright = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "openFilesOnly",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        pyright = { enabled = false },
        ruff_lsp = { enabled = false },
        pylyzer = { enabled = false },
      },
    },
  },
  -- {
  --   "MysticalDevil/inlay-hints.nvim",
  --   event = "LspAttach",
  --   dependencies = { "neovim/nvim-lspconfig" },
  --   config = function()
  --     require("inlay-hints").setup()
  --   end,
  -- },
}
