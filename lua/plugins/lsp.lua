return {
  { "barreiroleo/ltex_extra.nvim" },
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
        marksman = {
          diagnostics = false,
        },
      },
    },
    setup = {
      -- XXX: still brittle and WIP
      -- integrate ltex_extra with lazyvim
      -- https://github.com/LazyVim/LazyVim/discussions/403
      ltex = function(_, opts)
        print("attach ltex")
        vim.api.nvim_create_autocmd("LspAttach", {
          callback = function(args)
            local client = vim.lsp.get_client_by_id(args.data.client_id)
            --if client.name == "ltex" then
            require("ltex_extra").setup({
              load_langs = { "de-DE", "en-US" },
              --init_check = true,
              path = "/home/elayn/.local/share/ltex",
            })
            --end
          end,
        })
      end,
    },

    -- {
    --   "MysticalDevil/inlay-hints.nvim",
    --   event = "LspAttach",
    --   dependencies = { "neovim/nvim-lspconfig" },
    --   config = function()
    --     require("inlay-hints").setup()
    --   end,
    -- },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        ["markdownlint-cli2"] = {
          args = { "--config", "/home/elayn/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
